import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Single nutrition metric row: icon + label + value.
class NutritionRow extends StatelessWidget {
  /// Creates a [NutritionRow].
  const NutritionRow({
    required this.label,
    required this.value,
    super.key,
    this.icon,
    this.valueColor,
  });

  /// Metric label (e.g. "Protein").
  final String label;

  /// Formatted value string (e.g. "45g").
  final String value;

  /// Optional leading icon.
  final IconData? icon;

  /// Override color for the value text.
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 16, color: AppColors.textHint),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Text(
          value,
          style: AppTypography.labelMedium.copyWith(
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
