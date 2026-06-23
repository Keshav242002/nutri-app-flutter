import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Card showing how many days were tracked and meals skipped this week.
class TrackingStatCard extends StatelessWidget {
  /// Creates a [TrackingStatCard].
  const TrackingStatCard({
    required this.daysLogged,
    required this.mealsSkipped,
    super.key,
  });

  /// Number of days with at least one logged meal.
  final int daysLogged;

  /// Total meals skipped across the week.
  final int mealsSkipped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: AppColors.success,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              '$daysLogged / 7 days logged',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (mealsSkipped > 0)
            Text(
              '$mealsSkipped meal${mealsSkipped == 1 ? '' : 's'} skipped',
              style: AppTypography.caption.copyWith(
                color: AppColors.textHint,
              ),
            ),
        ],
      ),
    );
  }
}
