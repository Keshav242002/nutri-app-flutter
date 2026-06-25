import 'package:ahara/core/providers/meal_plan_sync_provider.dart';
import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/providers/tracker_sync_provider.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/dashboard/domain/models/log_meal_request.dart';
import 'package:ahara/features/dashboard/domain/models/meal_log.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:ahara/features/week/domain/models/grocery_list.dart';
import 'package:ahara/features/week/domain/models/week_meal_day.dart';
import 'package:ahara/features/week/domain/models/week_state.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:ahara/features/week/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'week_controller.g.dart';

/// Manages state for the Week tab screen.
///
/// On build: loads week plans + weekly nutrition in parallel.
/// Day logs load lazily on day tap. Grocery loads lazily on pill tap.
@riverpod
class WeekController extends _$WeekController {
  @override
  Future<WeekState> build() async {
    // A meal logged on any screen (e.g. the home tab) bumps this revision;
    // silently refetch weekly nutrition + the selected day's logs so the
    // stats, day chips and per-meal statuses stay live. Grocery and the
    // current week / selected day are deliberately left untouched.
    ref
      // A meal logged on any screen (e.g. the home tab) bumps this revision;
      // refetch weekly nutrition + the selected day's logs so stats stay live.
      ..listen(trackerLogRevisionProvider, (_, __) => _syncFromRevision())
      // A meal swapped on any screen (e.g. the home tab) bumps this revision;
      // refetch the displayed week's plans so day cards show the new recipe.
      ..listen(mealPlanRevisionProvider, (_, __) => _syncPlanFromRevision());

    final repo = ref.read(weekRepositoryProvider);
    final now = DateTime.now();
    final weekStart = _weekMonday(now);
    final weekEnd = weekStart.add(const Duration(days: 6));
    final fromStr = _fmt(weekStart);
    final toStr = _fmt(weekEnd);

    late Result<List<WeekMealDay>> plansResult;
    late Result<WeeklyNutrition> nutritionResult;

    await Future.wait<void>([
      repo
          .getWeekMealPlans(fromStr)
          .then((Result<List<WeekMealDay>> r) => plansResult = r),
      repo
          .getWeeklyNutrition(fromStr, toStr)
          .then((Result<WeeklyNutrition> r) => nutritionResult = r),
    ]);

    final plans = plansResult.when(
      success: (data) => data,
      failure: (e) => throw e,
    );
    final nutrition = nutritionResult.when(
      success: (data) => data,
      failure: (e) => throw e,
    );

    // Load today's logs immediately — needed for meal card states.
    final logsResult = await repo.getLogsForDate(_fmt(now));
    final todayLogs = logsResult.when(
      success: (data) => data,
      failure: (_) => <MealLog>[],
    );

    return WeekState(
      weekStart: weekStart,
      selectedDay: now,
      weekPlans: plans,
      weeklyNutrition: nutrition,
      selectedDayLogs: todayLogs,
    );
  }

  // ---------------------------------------------------------------------------
  // Navigation
  // ---------------------------------------------------------------------------

  /// Advances the displayed week by one week.
  Future<void> nextWeek() => _shiftWeek(7);

  /// Moves the displayed week back by one week.
  Future<void> prevWeek() => _shiftWeek(-7);

  Future<void> _shiftWeek(int days) async {
    final s = state.value;
    if (s == null) return;

    final newStart = s.weekStart.add(Duration(days: days));
    final now = DateTime.now();
    final isCurrentWeek = _weekMonday(now) == newStart;
    final newSelected = isCurrentWeek ? now : newStart;

    state = AsyncData(
      s.copyWith(
        weekStart: newStart,
        selectedDay: newSelected,
        weekPlans: [],
        weeklyNutrition: null,
        groceryList: null,
        selectedDayLogs: [],
        isLoadingSelectedDayLogs: false,
        isGroceryLoading: false,
        groceryError: null,
      ),
    );

    await _reloadWeekData(newStart, newSelected);
  }

  Future<void> _reloadWeekData(DateTime weekStart, DateTime selected) async {
    final repo = ref.read(weekRepositoryProvider);
    final weekEnd = weekStart.add(const Duration(days: 6));
    final fromStr = _fmt(weekStart);
    final toStr = _fmt(weekEnd);

    late Result<List<WeekMealDay>> plansResult;
    late Result<WeeklyNutrition> nutritionResult;

    await Future.wait<void>([
      repo
          .getWeekMealPlans(fromStr)
          .then((Result<List<WeekMealDay>> r) => plansResult = r),
      repo
          .getWeeklyNutrition(fromStr, toStr)
          .then((Result<WeeklyNutrition> r) => nutritionResult = r),
    ]);

    final plans = plansResult.when(
      success: (List<WeekMealDay> d) => d,
      failure: (_) => <WeekMealDay>[],
    );
    final nutrition =
        nutritionResult.when(success: (d) => d, failure: (_) => null);

    final s = state.value;
    if (s == null) return;
    state = AsyncData(
      s.copyWith(weekPlans: plans, weeklyNutrition: nutrition),
    );

    await _loadLogsForDay(selected);
  }

  // ---------------------------------------------------------------------------
  // Day selection
  // ---------------------------------------------------------------------------

  /// Selects [day] and lazily loads its logs.
  void selectDay(DateTime day) {
    final s = state.value;
    if (s == null) return;

    final isFuture = day.isAfter(DateTime.now());
    state = AsyncData(
      s.copyWith(
        selectedDay: day,
        selectedDayLogs: [],
        isLoadingSelectedDayLogs: !isFuture,
      ),
    );

    if (!isFuture) {
      _loadLogsForDay(day);
    }
  }

  Future<void> _loadLogsForDay(DateTime day) async {
    final result =
        await ref.read(weekRepositoryProvider).getLogsForDate(_fmt(day));
    final s = state.value;
    if (s == null) return;

    result.when(
      success: (logs) => state = AsyncData(
        s.copyWith(selectedDayLogs: logs, isLoadingSelectedDayLogs: false),
      ),
      failure: (_) => state = AsyncData(
        s.copyWith(isLoadingSelectedDayLogs: false),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Meal logging
  // ---------------------------------------------------------------------------

  /// Logs the planned meal in [slot] as eaten with [servings].
  Future<void> markAsEaten({
    required String slot,
    required int plannedRecipeId,
    required double servings,
  }) async {
    final s = state.value;
    if (s == null) return;

    final req = LogMealRequest(
      logDate: _fmt(s.selectedDay),
      slot: slot,
      status: 'ate_planned',
      plannedRecipeId: plannedRecipeId,
      actualRecipeId: plannedRecipeId,
      servingsEaten: servings.toString(),
    );

    final result = await ref.read(weekRepositoryProvider).logMeal(req);
    result.when(
      success: (_) {
        ref
            .read(toastProvider.notifier)
            .show('Meal logged!', type: ToastType.success);
        _loadLogsForDay(s.selectedDay);
        _refreshNutritionSilently();
        ref.read(trackerLogRevisionProvider.notifier).bump();
      },
      failure: (e) => ref.read(toastProvider.notifier).show(e.message),
    );
  }

  /// Skips the meal in [slot] for the selected day.
  Future<void> skipMeal({
    required String slot,
    required int plannedRecipeId,
  }) async {
    final s = state.value;
    if (s == null) return;

    final req = LogMealRequest(
      logDate: _fmt(s.selectedDay),
      slot: slot,
      status: 'skipped',
      plannedRecipeId: plannedRecipeId,
    );
    await _logAndRefresh(req, successMessage: 'Skipped — no worries.');
  }

  /// Logs a custom meal in [slot] for the selected day.
  Future<void> logCustom({
    required String slot,
    required String description,
    required int kcal,
    double? protein,
    double? carbs,
    double? fat,
  }) async {
    final s = state.value;
    if (s == null) return;

    final req = LogMealRequest(
      logDate: _fmt(s.selectedDay),
      slot: slot,
      status: 'ate_custom',
      customDescription: description,
      customCalories: kcal,
      customProteinG: protein?.toString(),
      customCarbsG: carbs?.toString(),
      customFatG: fat?.toString(),
    );
    await _logAndRefresh(req, successMessage: 'Custom meal logged!');
  }

  Future<void> _logAndRefresh(
    LogMealRequest req, {
    required String successMessage,
  }) async {
    final s = state.value;
    if (s == null) return;

    final result = await ref.read(weekRepositoryProvider).logMeal(req);
    result.when(
      success: (_) {
        ref
            .read(toastProvider.notifier)
            .show(successMessage, type: ToastType.success);
        _loadLogsForDay(s.selectedDay);
        _refreshNutritionSilently();
        ref.read(trackerLogRevisionProvider.notifier).bump();
      },
      failure: (e) => ref.read(toastProvider.notifier).show(e.message),
    );
  }

  /// Requests a regenerated recipe for [slot] WITHOUT committing it.
  ///
  /// Returns the new recipe, or null on failure (an error toast is shown).
  Future<RecipeSlim?> fetchSwap(String slot) async {
    final s = state.value;
    if (s == null) return null;

    final result = await ref
        .read(weekRepositoryProvider)
        .regenerateSlot(_fmt(s.selectedDay), slot);
    return result.when(
      success: (RecipeSlim recipe) => recipe,
      failure: (e) {
        ref.read(toastProvider.notifier).show(e.message);
        return null;
      },
    );
  }

  /// Commits a fetched swap into the selected day's plan.
  void applySwap(String slot, RecipeSlim recipe) {
    final s = state.value;
    if (s == null) return;

    final dayStr = _fmt(s.selectedDay);
    final updatedPlans = s.weekPlans.map((WeekMealDay day) {
      if (day.planDate != dayStr) return day;
      return switch (slot) {
        'breakfast' => day.copyWith(breakfast: recipe),
        'lunch' => day.copyWith(lunch: recipe),
        _ => day.copyWith(dinner: recipe),
      };
    }).toList();

    state = AsyncData(s.copyWith(weekPlans: updatedPlans));
    // Notify other screens (e.g. the home tab) that the plan changed so they
    // can refetch. The swap was already persisted server-side by fetchSwap.
    ref.read(mealPlanRevisionProvider.notifier).bump();
  }

  /// Refetches the displayed week's plans after a swap made on another screen
  /// bumps [mealPlanRevisionProvider]. Only the meal plans are refreshed;
  /// nutrition, grocery, the selected day and its logs are left untouched.
  Future<void> _syncPlanFromRevision() async {
    final s = state.value;
    if (s == null) return;

    final result = await ref
        .read(weekRepositoryProvider)
        .getWeekMealPlans(_fmt(s.weekStart));
    result.when(
      success: (List<WeekMealDay> plans) {
        final cur = state.value;
        if (cur != null) {
          state = AsyncData(cur.copyWith(weekPlans: plans));
        }
      },
      failure: (_) {},
    );
  }

  Future<void> _refreshNutritionSilently() async {
    final s = state.value;
    if (s == null) return;

    final weekEnd = s.weekStart.add(const Duration(days: 6));
    final result = await ref.read(weekRepositoryProvider).getWeeklyNutrition(
      _fmt(s.weekStart),
      _fmt(weekEnd),
    );
    result.when(
      success: (nutrition) {
        final cur = state.value;
        if (cur != null) {
          state = AsyncData(cur.copyWith(weeklyNutrition: nutrition));
        }
      },
      failure: (_) {},
    );
  }

  /// Responds to a meal logged on another screen (via
  /// [trackerLogRevisionProvider]). Refetches weekly nutrition (drives the
  /// stats, day chips and counts) and reloads the selected day's logs (drives
  /// the per-meal statuses). Grocery, the current week and the selected day
  /// are left as-is.
  void _syncFromRevision() {
    final s = state.value;
    if (s == null) return;
    _refreshNutritionSilently();
    if (!s.selectedDay.isAfter(DateTime.now())) {
      _loadLogsForDay(s.selectedDay);
    }
  }

  // ---------------------------------------------------------------------------
  // Grocery
  // ---------------------------------------------------------------------------

  /// Lazily loads the grocery list for the current week.
  Future<void> loadGrocery() async {
    final s = state.value;
    if (s == null || s.groceryList != null) return;

    state = AsyncData(
      s.copyWith(isGroceryLoading: true, groceryError: null),
    );

    final planDate = _fmt(s.weekStart);
    final result =
        await ref.read(weekRepositoryProvider).getGroceryList(planDate);
    _applyGroceryResult(result);
  }

  /// Force-recomputes the grocery list for the current week.
  Future<void> refreshGrocery() async {
    final s = state.value;
    if (s == null) return;

    state = AsyncData(
      s.copyWith(isGroceryLoading: true, groceryError: null),
    );

    final planDate = _fmt(s.weekStart);
    final result =
        await ref.read(weekRepositoryProvider).refreshGroceryList(planDate);
    _applyGroceryResult(result);
  }

  void _applyGroceryResult(Result<GroceryList> result) {
    final s = state.value;
    if (s == null) return;

    result.when(
      success: (list) => state = AsyncData(
        s.copyWith(
          groceryList: list,
          isGroceryLoading: false,
          groceryError: null,
          checkedItems: {},
        ),
      ),
      failure: (e) {
        if (s.groceryList != null) {
          // Keep existing list visible; toast the error.
          ref.read(toastProvider.notifier).show(e.message);
          state = AsyncData(s.copyWith(isGroceryLoading: false));
        } else {
          state = AsyncData(
            s.copyWith(isGroceryLoading: false, groceryError: e),
          );
        }
      },
    );
  }

  /// Toggles the local checked state for [ingredientAppId].
  void toggleGroceryItem(String ingredientAppId) {
    final s = state.value;
    if (s == null) return;

    final current = s.checkedItems[ingredientAppId] ?? false;
    state = AsyncData(
      s.copyWith(
        checkedItems: {...s.checkedItems, ingredientAppId: !current},
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  static DateTime _weekMonday(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  static String _fmt(DateTime d) {
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '${d.year}-$m-$day';
  }
}
