import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

const _dayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

/// A single day chip in the week selector row.
///
/// Variants: past-logged (green dot), today-selected (filled),
/// today-unselected, future (dashed border).
class DayChip extends StatelessWidget {
  /// Creates a [DayChip].
  const DayChip({
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.calorieLabel,
    required this.isLogged,
    required this.onTap,
    super.key,
  });

  /// The date this chip represents.
  final DateTime day;

  /// Whether this chip is the currently selected day.
  final bool isSelected;

  /// Whether this day is today.
  final bool isToday;

  /// Calorie string to display (e.g. "1840") or "—" for no data.
  final String calorieLabel;

  /// Whether any meals were logged on this day.
  final bool isLogged;

  /// Called when the chip is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isFuture =
        day.isAfter(DateTime.now()) &&
        !(day.year == DateTime.now().year &&
            day.month == DateTime.now().month &&
            day.day == DateTime.now().day);

    // Fill for selected, white surface for logged days, bordered for
    // future/unlogged — per docs/design/week_tab/week_tab_final.html.
    final Color bgColor;
    final Border? border;
    if (isSelected) {
      bgColor = AppColors.turmeric;
      border = null;
    } else if (isLogged && !isFuture) {
      bgColor = AppColors.white;
      border = Border.all(color: AppColors.creamBorder);
    } else {
      bgColor = Colors.transparent;
      border = Border.all(color: AppColors.creamBorder);
    }

    final dayColor = isSelected ? AppColors.navyDeep : AppColors.textSecondary;
    final dateColor = isSelected
        ? AppColors.navyDeep
        : isFuture
        ? AppColors.textHint
        : AppColors.textPrimary;
    final kcalColor = isSelected ? AppColors.navyDeep : AppColors.textHint;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: border,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.turmeric.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _dayLabels[day.weekday - 1].toUpperCase(),
                  style: AppTypography.caption.copyWith(
                    color: dayColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${day.day}',
                  style: AppTypography.labelMedium.copyWith(
                    color: dateColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  isFuture ? '—' : calorieLabel,
                  style: AppTypography.caption.copyWith(
                    color: kcalColor,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
            if (isLogged && !isFuture)
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
