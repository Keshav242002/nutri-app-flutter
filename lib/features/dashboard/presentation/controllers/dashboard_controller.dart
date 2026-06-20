import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/dashboard/domain/models/daily_nutrition.dart';
import 'package:ahara/features/dashboard/domain/models/log_meal_request.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:ahara/features/dashboard/domain/models/meal_log.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:ahara/features/dashboard/domain/models/today_meal_plan.dart';
import 'package:ahara/features/dashboard/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_controller.freezed.dart';
part 'dashboard_controller.g.dart';

/// Composite state for the dashboard screen.
@freezed
abstract class DashboardState with _$DashboardState {
  /// Creates a [DashboardState].
  const factory DashboardState({
    required TodayMealPlan mealPlan,
    required DailyNutrition nutrition,
    required MealCardState breakfastState,
    required MealCardState lunchState,
    required MealCardState dinnerState,
  }) = _DashboardState;
}

/// Manages the dashboard screen state.
///
/// Fetches meal plan, nutrition, and today's logs in parallel on build.
/// Exposes action methods that call the repository and update card states.
@riverpod
class DashboardController extends _$DashboardController {
  @override
  Future<DashboardState> build() async {
    final repo = ref.watch(dashboardRepositoryProvider);
    final today = _today();

    // Parallel fetch with typed futures.
    late Result<TodayMealPlan> planResult;
    late Result<DailyNutrition> nutritionResult;
    late Result<List<MealLog>> logsResult;

    await Future.wait<void>([
      repo
          .getTodayMealPlan()
          .then((Result<TodayMealPlan> r) => planResult = r),
      repo
          .getDailyNutrition(today)
          .then((Result<DailyNutrition> r) => nutritionResult = r),
      repo
          .getTodayLogs(today)
          .then((Result<List<MealLog>> r) => logsResult = r),
    ]);

    final plan = planResult.when(
      success: (TodayMealPlan data) => data,
      failure: (AppException e) => throw e,
    );

    final nutrition = nutritionResult.when(
      success: (DailyNutrition data) => data,
      failure: (AppException e) => throw e,
    );

    // Logs failure is non-fatal — missing logs means all slots stay planned.
    final logs = logsResult.when(
      success: (List<MealLog> data) => data,
      failure: (AppException _) => <MealLog>[],
    );

    return DashboardState(
      mealPlan: plan,
      nutrition: nutrition,
      breakfastState: _cardFromLog(logs, MealSlot.breakfast, plan.breakfast),
      lunchState: _cardFromLog(logs, MealSlot.lunch, plan.lunch),
      dinnerState: _cardFromLog(logs, MealSlot.dinner, plan.dinner),
    );
  }

  // ---------------------------------------------------------------------------
  // Public action methods
  // ---------------------------------------------------------------------------

  /// Logs the planned meal as eaten with [servings].
  Future<void> markEaten(MealSlot slot, double servings) async {
    final s = state.value;
    if (s == null) return;

    final recipe = _recipeForSlot(s, slot);
    final req = LogMealRequest(
      logDate: _today(),
      slot: slot.name,
      status: 'ate_planned',
      plannedRecipeId: recipe?.id,
      actualRecipeId: recipe?.id,
      servingsEaten: servings.toString(),
    );
    final result = await ref.read(dashboardRepositoryProvider).logMeal(req);
    result.when(
      success: (MealLog _) {
        _updateCard(
          slot,
          MealCardState.eaten(
            recipe: recipe!,
            slot: slot,
            servingsEaten: servings,
          ),
        );
        _refreshNutritionSilently();
      },
      failure: (AppException e) => _showError(e.message),
    );
  }

  /// Logs a substituted recipe.
  Future<void> logSubstituted(
    MealSlot slot,
    RecipeSlim actualRecipe,
    double servings,
  ) async {
    final s = state.value;
    if (s == null) return;

    final planned = _recipeForSlot(s, slot);
    final req = LogMealRequest(
      logDate: _today(),
      slot: slot.name,
      status: 'ate_substituted',
      plannedRecipeId: planned?.id,
      actualRecipeId: actualRecipe.id,
      servingsEaten: servings.toString(),
    );
    final result = await ref.read(dashboardRepositoryProvider).logMeal(req);
    result.when(
      success: (MealLog _) {
        _updateCard(
          slot,
          MealCardState.loggedSubstituted(
            actualRecipe: actualRecipe,
            slot: slot,
          ),
        );
        _refreshNutritionSilently();
      },
      failure: (AppException e) => _showError(e.message),
    );
  }

  /// Logs a custom meal description.
  Future<void> logCustom(
    MealSlot slot,
    String description,
    int kcal, {
    double? protein,
    double? carbs,
    double? fat,
  }) async {
    final s = state.value;
    if (s == null) return;

    final planned = _recipeForSlot(s, slot);
    final req = LogMealRequest(
      logDate: _today(),
      slot: slot.name,
      status: 'ate_custom',
      plannedRecipeId: planned?.id,
      customDescription: description,
      customCalories: kcal,
      customProteinG: protein?.toString(),
      customCarbsG: carbs?.toString(),
      customFatG: fat?.toString(),
    );
    final result = await ref.read(dashboardRepositoryProvider).logMeal(req);
    result.when(
      success: (MealLog _) {
        _updateCard(
          slot,
          MealCardState.loggedCustom(
            description: description,
            calories: kcal,
            slot: slot,
          ),
        );
        _refreshNutritionSilently();
      },
      failure: (AppException e) => _showError(e.message),
    );
  }

  /// Marks a meal slot as skipped.
  Future<void> skipMeal(MealSlot slot) async {
    final s = state.value;
    if (s == null) return;

    final recipe = _recipeForSlot(s, slot);
    final req = LogMealRequest(
      logDate: _today(),
      slot: slot.name,
      status: 'skipped',
      plannedRecipeId: recipe?.id,
    );
    final result = await ref.read(dashboardRepositoryProvider).logMeal(req);
    result.when(
      success: (MealLog _) =>
          _updateCard(slot, MealCardState.skipped(recipe: recipe!, slot: slot)),
      failure: (AppException e) => _showError(e.message),
    );
  }

  /// Requests a new recipe for [slot] and updates the meal plan.
  Future<void> swapMeal(MealSlot slot) async {
    final s = state.value;
    if (s == null) return;

    final result = await ref
        .read(dashboardRepositoryProvider)
        .regenerateSlot(_today(), slot.name);
    result.when(
      success: (RecipeSlim newRecipe) {
        final updated = s.copyWith(
          mealPlan: _replacePlanSlot(s.mealPlan, slot, newRecipe),
        );
        state = AsyncData(
          _applyCard(
            updated,
            slot,
            MealCardState.planned(recipe: newRecipe, slot: slot),
          ),
        );
      },
      failure: (AppException e) => _showError(e.message),
    );
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  void _updateCard(MealSlot slot, MealCardState cardState) {
    final s = state.value;
    if (s == null) return;
    state = AsyncData(_applyCard(s, slot, cardState));
  }

  DashboardState _applyCard(
    DashboardState s,
    MealSlot slot,
    MealCardState card,
  ) {
    return switch (slot) {
      MealSlot.breakfast => s.copyWith(breakfastState: card),
      MealSlot.lunch => s.copyWith(lunchState: card),
      MealSlot.dinner => s.copyWith(dinnerState: card),
    };
  }

  Future<void> _refreshNutritionSilently() async {
    final s = state.value;
    if (s == null) return;
    final result = await ref
        .read(dashboardRepositoryProvider)
        .getDailyNutrition(_today());
    result.when(
      success: (DailyNutrition nutrition) =>
          state = AsyncData(s.copyWith(nutrition: nutrition)),
      failure: (AppException _) {},
    );
  }

  void _showError(String message) =>
      ref.read(toastProvider.notifier).show(message);

  RecipeSlim? _recipeForSlot(DashboardState s, MealSlot slot) {
    return switch (slot) {
      MealSlot.breakfast => s.mealPlan.breakfast,
      MealSlot.lunch => s.mealPlan.lunch,
      MealSlot.dinner => s.mealPlan.dinner,
    };
  }

  TodayMealPlan _replacePlanSlot(
    TodayMealPlan plan,
    MealSlot slot,
    RecipeSlim recipe,
  ) {
    return switch (slot) {
      MealSlot.breakfast => plan.copyWith(breakfast: recipe),
      MealSlot.lunch => plan.copyWith(lunch: recipe),
      MealSlot.dinner => plan.copyWith(dinner: recipe),
    };
  }

  static MealCardState _cardFromLog(
    List<MealLog> logs,
    MealSlot slot,
    RecipeSlim plannedRecipe,
  ) {
    final log = logs.where((l) => l.slot == slot.name).firstOrNull;
    if (log == null) {
      return MealCardState.planned(recipe: plannedRecipe, slot: slot);
    }
    return switch (log.status) {
      MealLogStatus.atePlanned => MealCardState.eaten(
        recipe: plannedRecipe,
        slot: slot,
        servingsEaten: log.servingsEaten ?? 1.0,
      ),
      MealLogStatus.ateSubstituted => MealCardState.loggedSubstituted(
        actualRecipe: _refToSlim(log.actualRecipe),
        slot: slot,
      ),
      MealLogStatus.ateCustom => MealCardState.loggedCustom(
        description: log.customDescription ?? '',
        calories: log.customCalories ?? 0,
        slot: slot,
      ),
      MealLogStatus.skipped =>
        MealCardState.skipped(recipe: plannedRecipe, slot: slot),
      MealLogStatus.planned =>
        MealCardState.planned(recipe: plannedRecipe, slot: slot),
    };
  }

  static RecipeSlim _refToSlim(MealLogRecipeRef? ref) {
    if (ref == null) {
      return const RecipeSlim(
        id: 0,
        name: '',
        slug: '',
        mealType: '',
        cuisine: '',
        prepTimeMin: 0,
        cachedCaloriesPerServing: 0,
      );
    }
    return RecipeSlim(
      id: ref.id,
      name: ref.name,
      slug: ref.slug,
      mealType: '',
      cuisine: '',
      prepTimeMin: 0,
      cachedCaloriesPerServing: ref.cachedCaloriesPerServing,
    );
  }

  static String _today() {
    final now = DateTime.now();
    final m = now.month.toString().padLeft(2, '0');
    final d = now.day.toString().padLeft(2, '0');
    return '${now.year}-$m-$d';
  }
}
