import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:flutter/material.dart';

const _dayLetters = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

/// 7-bar calorie chart for the week.
///
/// Filled bars for logged days, ghost bars for future/unlogged.
class DailyBreakdownChart extends StatelessWidget {
  /// Creates a [DailyBreakdownChart].
  const DailyBreakdownChart({
    required this.weekStart,
    required this.days,
    required this.calorieTarget,
    super.key,
  });

  /// Monday of the displayed week.
  final DateTime weekStart;

  /// Per-day entries (sparse — only logged days included).
  final List<DayNutritionEntry> days;

  /// Daily calorie target for scaling bars.
  final double calorieTarget;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final maxKcal = calorieTarget > 0 ? calorieTarget : 2000;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '7-Day Calorie Breakdown',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(7, (i) {
                final day = weekStart.add(Duration(days: i));
                final dayStr = _fmt(day);
                final isFuture = day.isAfter(now) &&
                    !(day.year == now.year &&
                        day.month == now.month &&
                        day.day == now.day);
                final entry = days
                    .where((DayNutritionEntry d) => d.date == dayStr)
                    .firstOrNull;
                final kcal = entry?.totals.calories ?? 0;
                final fraction =
                    (kcal / maxKcal).clamp(0.0, 1.0);

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: FractionallySizedBox(
                            alignment: Alignment.bottomCenter,
                            heightFactor: isFuture || kcal == 0
                                ? 0.12
                                : fraction,
                            child: Container(
                              decoration: BoxDecoration(
                                color: isFuture || kcal == 0
                                    ? AppColors.creamBorder
                                    : AppColors.turmeric,
                                borderRadius: BorderRadius.circular(4),
                                border: isFuture
                                    ? Border.all(
                                        color: AppColors.creamBorder,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _dayLetters[i],
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textHint,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  static String _fmt(DateTime d) {
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '${d.year}-$m-$day';
  }
}
