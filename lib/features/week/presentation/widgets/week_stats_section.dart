import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/dashboard/domain/models/nutrition_summary.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:ahara/features/week/presentation/widgets/daily_breakdown_chart.dart';
import 'package:ahara/features/week/presentation/widgets/macro_averages_card.dart';
import 'package:ahara/features/week/presentation/widgets/streak_card.dart';
import 'package:ahara/features/week/presentation/widgets/tracking_stat_card.dart';
import 'package:flutter/material.dart';

/// Stats section of the week tab — avg intake, macro bars, chart,
/// tracking count, and streak.
class WeekStatsSection extends StatelessWidget {
  /// Creates a [WeekStatsSection].
  const WeekStatsSection({
    required this.weekStart,
    required this.weeklyNutrition,
    super.key,
  });

  /// Monday of the displayed week.
  final DateTime weekStart;

  /// Weekly nutrition data (may be null while loading).
  final WeeklyNutrition? weeklyNutrition;

  @override
  Widget build(BuildContext context) {
    final days = weeklyNutrition?.days ?? [];
    final targets = days.isNotEmpty ? days.first.targets : null;

    // Average over days that have any logged data, INCLUDING today, so the
    // card reflects today's intake as it's logged. Days with no logged meals
    // (e.g. future days) are excluded so they don't dilute the average.
    final loggedDays = days
        .where((DayNutritionEntry d) => d.mealsEaten > 0)
        .toList();
    final averages = _averageOf(loggedDays);

    final daysLogged = days
        .where((DayNutritionEntry d) => d.mealsEaten > 0)
        .length;
    final mealsSkipped = days.fold<int>(
      0,
      (int acc, DayNutritionEntry d) => acc + d.mealsSkipped,
    );

    // Streak: consecutive days from today backwards with mealsEaten > 0.
    final now = DateTime.now();
    var streak = 0;
    for (var i = 0; i < 7; i++) {
      final d = now.subtract(Duration(days: i));
      final dayStr = _fmt(d);
      final entry = days
          .where((DayNutritionEntry e) => e.date == dayStr)
          .firstOrNull;
      if (entry != null && entry.mealsEaten > 0) {
        streak++;
      } else {
        break;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Weekly Stats',
            style: AppTypography.headingLarge.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          // Avg intake headline
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.navyDeep,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avg daily intake',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textOnDarkSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${averages.calories.toStringAsFixed(0)} kcal',
                  style: AppTypography.headingLarge.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          MacroAveragesCard(averages: averages, targets: targets),
          const SizedBox(height: AppSpacing.md),
          DailyBreakdownChart(
            weekStart: weekStart,
            days: days,
            calorieTarget: targets?.calories ?? 2000,
          ),
          const SizedBox(height: AppSpacing.md),
          TrackingStatCard(
            daysLogged: daysLogged,
            mealsSkipped: mealsSkipped,
          ),
          const SizedBox(height: AppSpacing.md),
          StreakCard(streakDays: streak),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }

  static String _fmt(DateTime d) {
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '${d.year}-$m-$day';
  }

  /// Mean daily intake across [entries]. Returns zeros when empty.
  static NutritionSummary _averageOf(List<DayNutritionEntry> entries) {
    if (entries.isEmpty) return const NutritionSummary();
    final n = entries.length;
    var calories = 0.0;
    var protein = 0.0;
    var carbs = 0.0;
    var fat = 0.0;
    var fiber = 0.0;
    for (final e in entries) {
      calories += e.totals.calories;
      protein += e.totals.proteinG;
      carbs += e.totals.carbsG;
      fat += e.totals.fatG;
      fiber += e.totals.fiberG;
    }
    return NutritionSummary(
      calories: calories / n,
      proteinG: protein / n,
      carbsG: carbs / n,
      fatG: fat / n,
      fiberG: fiber / n,
    );
  }
}
