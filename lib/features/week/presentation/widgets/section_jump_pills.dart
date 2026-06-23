import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// The three section labels for the week tab.
enum WeekSection {
  /// Meals section.
  meals,

  /// Stats section.
  stats,

  /// Grocery section.
  grocery,
}

/// Pill row that jumps to a named section of the week screen.
class SectionJumpPills extends StatelessWidget {
  /// Creates a [SectionJumpPills].
  const SectionJumpPills({
    required this.active,
    required this.onTap,
    super.key,
  });

  /// Currently active section (highlighted pill).
  final WeekSection active;

  /// Called when the user taps a pill.
  final void Function(WeekSection section) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: WeekSection.values.map((s) {
        final isActive = s == active;
        return Padding(
          padding: const EdgeInsets.only(right: AppSpacing.sm),
          child: GestureDetector(
            onTap: () => onTap(s),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.xs + 2,
              ),
              decoration: BoxDecoration(
                color: isActive ? AppColors.amberDeep : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isActive ? AppColors.amberDeep : AppColors.creamBorder,
                ),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: AppColors.navyDeep.withValues(alpha: 0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                _label(s),
                style: AppTypography.labelMedium.copyWith(
                  color: isActive ? AppColors.white : AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  static String _label(WeekSection s) => switch (s) {
    WeekSection.meals => 'Meals',
    WeekSection.stats => 'Stats',
    WeekSection.grocery => 'Grocery',
  };
}
