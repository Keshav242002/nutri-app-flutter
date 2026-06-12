import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Visual variant of [AppChip].
enum AppChipVariant {
  /// Fully-round pill (999px radius).
  pill,

  /// Inline chip with 8px radius.
  inline,
}

/// Ahara design-system chip.
///
/// Pill (999px) and inline (8px) variants.
/// Selected state uses Navy Subtle background.
class AppChip extends StatelessWidget {
  /// Creates an [AppChip].
  const AppChip({
    required this.label,
    super.key,
    this.variant = AppChipVariant.pill,
    this.isSelected = false,
    this.onTap,
  });

  /// Chip label.
  final String label;

  /// Shape variant.
  final AppChipVariant variant;

  /// Whether this chip is in the selected state.
  final bool isSelected;

  /// Callback on tap.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = variant == AppChipVariant.pill
        ? AppRadius.pill
        : const BorderRadius.all(Radius.circular(AppRadius.sm));

    final bg = isSelected ? AppColors.navySubtle : AppColors.creamBorder;
    final fg = isSelected ? AppColors.navyDeep : AppColors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(color: bg, borderRadius: radius),
        child: Text(
          label,
          style: AppTypography.labelMedium.copyWith(color: fg),
        ),
      ),
    );
  }
}
