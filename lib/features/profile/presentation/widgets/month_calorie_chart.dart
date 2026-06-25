import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:flutter/material.dart';

/// A week-by-week calorie chart for a month.
///
/// Buckets the sparse per-day entries into calendar weeks of the month and
/// shows the *average daily* calories for each week (comparable against the
/// daily [calorieTarget]). Weeks with no tracked days render as ghost bars.
///
/// A weekly rollup (4–5 bars) is used rather than ~30 daily bars so the chart
/// stays legible on a phone.
class MonthCalorieChart extends StatelessWidget {
  /// Creates a [MonthCalorieChart].
  const MonthCalorieChart({
    required this.monthStart,
    required this.monthEnd,
    required this.days,
    required this.calorieTarget,
    super.key,
  });

  /// First day of the month range.
  final DateTime monthStart;

  /// Last day of the month range (today, for the current month).
  final DateTime monthEnd;

  /// Sparse per-day entries (only tracked days included).
  final List<DayNutritionEntry> days;

  /// Daily calorie target used to scale the bars.
  final double calorieTarget;

  @override
  Widget build(BuildContext context) {
    final buckets = _buildBuckets();
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
            'Avg Daily Calories by Week',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(buckets.length, (i) {
                final bucket = buckets[i];
                final hasData = bucket.trackedDays > 0;
                final avg = hasData ? bucket.avgCalories : 0.0;
                final fraction = (avg / maxKcal).clamp(0.0, 1.0);

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          hasData ? avg.round().toString() : '–',
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textHint,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: FractionallySizedBox(
                            alignment: Alignment.bottomCenter,
                            heightFactor: hasData ? fraction : 0.06,
                            child: Container(
                              decoration: BoxDecoration(
                                color: hasData
                                    ? AppColors.turmeric
                                    : AppColors.creamBorder,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'W${i + 1}',
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

  List<_WeekBucket> _buildBuckets() {
    // Number of week buckets spanning monthStart → monthEnd.
    final spanDays = monthEnd.difference(monthStart).inDays;
    final count = (spanDays / 7).floor() + 1;
    final buckets = List.generate(count, (_) => _WeekBucket());

    for (final entry in days) {
      final date = DateTime.tryParse(entry.date);
      if (date == null) continue;
      final offset = date.difference(monthStart).inDays;
      if (offset < 0) continue;
      final index = offset ~/ 7;
      if (index < 0 || index >= buckets.length) continue;
      buckets[index]
        ..trackedDays += 1
        ..totalCalories += entry.totals.calories;
    }
    return buckets;
  }
}

class _WeekBucket {
  int trackedDays = 0;
  double totalCalories = 0;

  double get avgCalories => trackedDays == 0 ? 0 : totalCalories / trackedDays;
}
