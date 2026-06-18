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
/// Use [turmericSelected] for multi-select chips in onboarding (allergies,
/// secondary cuisines) — shows a turmeric border + tint + check icon when
/// selected. Default selected state uses Navy Subtle background.
class AppChip extends StatelessWidget {
  /// Creates an [AppChip].
  const AppChip({
    required this.label,
    super.key,
    this.variant = AppChipVariant.pill,
    this.isSelected = false,
    this.turmericSelected = false,
    this.onTap,
  });

  /// Chip label.
  final String label;

  /// Shape variant.
  final AppChipVariant variant;

  /// Whether this chip is in the selected state.
  final bool isSelected;

  /// When `true`, selected state uses turmeric border + tint + check icon
  /// instead of the default navy-subtle background.
  final bool turmericSelected;

  /// Callback on tap.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = variant == AppChipVariant.pill
        ? AppRadius.pill
        : const BorderRadius.all(Radius.circular(AppRadius.sm));

    final Color bg;
    final Color fg;
    final Border? border;

    if (turmericSelected && isSelected) {
      bg = AppColors.turmeric.withValues(alpha: 0.15);
      fg = AppColors.turmeric;
      border = Border.all(color: AppColors.turmeric, width: 1.5);
    } else {
      bg = isSelected ? AppColors.navySubtle : AppColors.creamBorder;
      fg = isSelected ? AppColors.navyDeep : AppColors.textSecondary;
      border = null;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: radius,
          border: border,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (turmericSelected && isSelected) ...[
              Icon(Icons.check, size: 14, color: fg),
              const SizedBox(width: 4),
            ],
            Text(label, style: AppTypography.labelMedium.copyWith(color: fg)),
          ],
        ),
      ),
    );
  }
}
