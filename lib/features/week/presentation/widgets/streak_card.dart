import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Card showing the current logging streak (days in a row with meals logged).
class StreakCard extends StatelessWidget {
  /// Creates a [StreakCard].
  const StreakCard({required this.streakDays, super.key});

  /// Number of consecutive days with at least one logged meal.
  final int streakDays;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: streakDays > 0
            ? AppColors.turmericDim
            : AppColors.creamDeep,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: streakDays > 0
              ? AppColors.turmericLight
              : AppColors.creamBorder,
        ),
      ),
      child: Row(
        children: [
          Text(
            streakDays > 0 ? '\u{1F525}' : '\u{1F4C5}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: AppSpacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                streakDays > 0
                    ? '$streakDays day streak'
                    : 'No streak yet',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                streakDays > 0 ? 'Keep it up!' : 'Log today to start one',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
