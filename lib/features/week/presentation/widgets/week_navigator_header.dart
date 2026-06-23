import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

const _months = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

String _fmtShort(DateTime d) => '${d.day} ${_months[d.month - 1]}';

/// Displays the week range label with prev/next navigation arrows.
class WeekNavigatorHeader extends StatelessWidget {
  /// Creates a [WeekNavigatorHeader].
  const WeekNavigatorHeader({
    required this.weekStart,
    required this.onPrev,
    required this.onNext,
    super.key,
  });

  /// The Monday of the displayed week.
  final DateTime weekStart;

  /// Called when the user taps the back arrow.
  final VoidCallback onPrev;

  /// Called when the user taps the forward arrow.
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final weekEnd = weekStart.add(const Duration(days: 6));
    final now = DateTime.now();
    final currentMonday = now.subtract(Duration(days: now.weekday - 1));
    final isCurrentWeek =
        weekStart.year == currentMonday.year &&
        weekStart.month == currentMonday.month &&
        weekStart.day == currentMonday.day;
    final label = isCurrentWeek
        ? 'This Week'
        : '${_fmtShort(weekStart)} – ${_fmtShort(weekEnd)}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPrev,
          icon: const Icon(Icons.chevron_left),
          color: AppColors.textSecondary,
        ),
        Text(
          label,
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        IconButton(
          onPressed: onNext,
          icon: const Icon(Icons.chevron_right),
          color: AppColors.textSecondary,
          padding: const EdgeInsets.only(right: AppSpacing.xs),
        ),
      ],
    );
  }
}
