import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:ahara/features/dashboard/domain/models/meal_log.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/custom_meal_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/dashboard_meal_card.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/log_chooser_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/mark_as_eaten_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/meal_options_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/swap_sheet.dart';
import 'package:ahara/features/week/domain/models/week_meal_day.dart';
import 'package:ahara/features/week/presentation/controllers/week_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const _slots = ['breakfast', 'lunch', 'dinner'];

const _dayNames = [
  'Monday', 'Tuesday', 'Wednesday', 'Thursday',
  'Friday', 'Saturday', 'Sunday',
];

/// Meals section of the week tab — shows 3 meal cards for the selected day.
///
/// Reuses the home tab's [DashboardMealCard] so the two tabs are visually
/// identical. Actions (mark eaten / swap / log / skip / un-skip) are enabled
/// only for today; past and future days render read-only.
class WeekMealSection extends ConsumerStatefulWidget {
  /// Creates a [WeekMealSection].
  const WeekMealSection({
    required this.selectedDay,
    required this.weekPlans,
    required this.dayLogs,
    super.key,
  });

  /// The currently selected day.
  final DateTime selectedDay;

  /// All week meal plans (one per day that has a plan).
  final List<WeekMealDay> weekPlans;

  /// Logs for the selected day.
  final List<MealLog> dayLogs;

  @override
  ConsumerState<WeekMealSection> createState() => _WeekMealSectionState();
}

class _WeekMealSectionState extends ConsumerState<WeekMealSection> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isToday = _sameDay(widget.selectedDay, now);
    final dayName = _dayNames[widget.selectedDay.weekday - 1];
    final title = isToday ? "Today's Meals" : "$dayName's Meals";

    final dayStr = _fmt(widget.selectedDay);
    final weekDay =
        widget.weekPlans.where((p) => p.planDate == dayStr).firstOrNull;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text(
            title,
            style: AppTypography.headingLarge.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (weekDay == null && widget.weekPlans.isEmpty)
            _emptyState()
          else
            for (final slot in _slots)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: _buildCard(slot, weekDay, isToday, now),
              ),
        ],
      ),
    );
  }

  Widget _buildCard(
    String slot,
    WeekMealDay? weekDay,
    bool isToday,
    DateTime now,
  ) {
    final recipe = switch (slot) {
      'breakfast' => weekDay?.breakfast,
      'lunch' => weekDay?.lunch,
      _ => weekDay?.dinner,
    };

    if (recipe == null) return _notPlanned(slot);

    final log = widget.dayLogs.where((l) => l.slot == slot).firstOrNull;
    final cardState = _mapState(slot, recipe, log);
    final isCurrentSlot = isToday && _isNowSlot(slot, now.hour);

    return DashboardMealCard(
      cardState: cardState,
      isCurrentSlot: isCurrentSlot,
      interactive: isToday,
      onMarkEaten: () => _onMarkEaten(slot, recipe),
      onOptions: () => _onOptions(slot, recipe),
      onTap: () => _onTap(recipe),
      onEdit: () => _onEditSkipped(slot, recipe),
    );
  }

  // ---------------------------------------------------------------------------
  // Action handlers (today only — the card hides controls otherwise)
  // ---------------------------------------------------------------------------

  WeekController get _controller =>
      ref.read(weekControllerProvider.notifier);

  void _onMarkEaten(String slot, RecipeSlim recipe) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MarkAsEatenSheet(
        recipe: recipe,
        slot: MealSlot.values.byName(slot),
        onConfirm: (servings) => _controller.markAsEaten(
          slot: slot,
          plannedRecipeId: recipe.id,
          servings: servings,
        ),
      ),
    );
  }

  void _onOptions(String slot, RecipeSlim recipe) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MealOptionsSheet.planned(
        recipe: recipe,
        slot: MealSlot.values.byName(slot),
        onSwap: () => _onSwap(slot),
        onLogElse: () => _onLogElse(slot),
        onSkip: () =>
            _controller.skipMeal(slot: slot, plannedRecipeId: recipe.id),
      ),
    );
  }

  void _onEditSkipped(String slot, RecipeSlim recipe) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MealOptionsSheet.skipped(
        recipe: recipe,
        slot: MealSlot.values.byName(slot),
        onMarkEaten: () => _onMarkEaten(slot, recipe),
        onLogElse: () => _onLogElse(slot),
        onSwap: () => _onSwap(slot),
      ),
    );
  }

  void _onSwap(String slot) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SwapSheet(
        onLoad: () => _controller.fetchSwap(slot),
        onApply: (recipe) => _controller.applySwap(slot, recipe),
      ),
    );
  }

  void _onLogElse(String slot) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LogChooserSheet(
        onCustom: () => _onCustom(slot),
      ),
    );
  }

  void _onCustom(String slot) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CustomMealSheet(
        slot: MealSlot.values.byName(slot),
        onLog: (desc, kcal, {double? protein, double? carbs, double? fat}) =>
            _controller.logCustom(
          slot: slot,
          description: desc,
          kcal: kcal,
          protein: protein,
          carbs: carbs,
          fat: fat,
        ),
      ),
    );
  }

  void _onTap(RecipeSlim recipe) {
    context.push(
      RoutePaths.recipeDetail.replaceFirst(':slug', recipe.slug),
    );
  }

  // ---------------------------------------------------------------------------
  // State mapping
  // ---------------------------------------------------------------------------

  MealCardState _mapState(String slot, RecipeSlim recipe, MealLog? log) {
    final mealSlot = MealSlot.values.byName(slot);
    if (log == null) {
      return MealCardState.planned(recipe: recipe, slot: mealSlot);
    }
    return switch (log.status) {
      MealLogStatus.atePlanned => MealCardState.eaten(
          recipe: recipe,
          slot: mealSlot,
          servingsEaten: log.servingsEaten ?? 1.0,
        ),
      MealLogStatus.ateSubstituted => MealCardState.loggedSubstituted(
          actualRecipe: _refToSlim(log.actualRecipe),
          slot: mealSlot,
        ),
      MealLogStatus.ateCustom => MealCardState.loggedCustom(
          description: log.customDescription ?? '',
          calories: log.customCalories ?? 0,
          slot: mealSlot,
        ),
      MealLogStatus.skipped =>
        MealCardState.skipped(recipe: recipe, slot: mealSlot),
      MealLogStatus.planned =>
        MealCardState.planned(recipe: recipe, slot: mealSlot),
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

  // ---------------------------------------------------------------------------
  // Sub-views
  // ---------------------------------------------------------------------------

  Widget _notPlanned(String slot) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Row(
        children: [
          const Icon(Icons.restaurant_outlined, color: AppColors.textHint),
          const SizedBox(width: AppSpacing.sm),
          Text(
            '${_slotLabel(slot)} not planned',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textHint,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyState() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              color: AppColors.textHint,
              size: 40,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'No meals planned for this week',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textHint,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  static bool _isNowSlot(String slot, int hour) => switch (slot) {
        'breakfast' => hour < 11,
        'lunch' => hour >= 11 && hour < 16,
        _ => hour >= 16,
      };

  static String _slotLabel(String slot) => switch (slot) {
        'breakfast' => 'Breakfast',
        'lunch' => 'Lunch',
        _ => 'Dinner',
      };

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static String _fmt(DateTime d) {
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '${d.year}-$m-$day';
  }
}
