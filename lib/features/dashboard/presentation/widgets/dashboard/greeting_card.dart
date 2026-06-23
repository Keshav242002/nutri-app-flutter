import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/dashboard/domain/models/daily_nutrition.dart';
import 'package:flutter/material.dart';

/// Top greeting card — time-based salutation, date, and remaining kcal.
class GreetingCard extends StatelessWidget {
  /// Creates a [GreetingCard].
  const GreetingCard({
    required this.firstName,
    required this.nutrition,
    super.key,
  });

  /// User's first name for the greeting.
  final String firstName;

  /// Today's nutrition data for remaining kcal display.
  final DailyNutrition nutrition;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final greeting = _greeting(now.hour);
    final remaining = (nutrition.targets.calories - nutrition.totals.calories)
        .round()
        .clamp(0, 99999);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.creamBorder),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.white,
            AppColors.turmeric.withValues(alpha: 0.04),
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.turmeric.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Text(
              '👋',
              style: TextStyle(fontSize: 22),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$greeting, $firstName.',
                  style: AppTypography.headingMedium.copyWith(
                    color: AppColors.navyDeep,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${_weekday(now.weekday)}, ${now.day} ${_month(now.month)}'
                  ' · ${_formatKcal(remaining)} kcal remaining',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _greeting(int hour) {
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  static String _weekday(int w) => const [
        '',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ][w];

  static String _month(int m) => const [
        '',
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ][m];

  static String _formatKcal(int n) {
    if (n >= 1000) {
      final k = (n / 1000).toStringAsFixed(1);
      return '${k}k';
    }
    return '$n';
  }
}
