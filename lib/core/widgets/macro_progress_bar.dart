import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Macro nutrient type for [MacroProgressBar].
enum MacroType {
  /// Protein — deep terracotta.
  protein,

  /// Carbohydrates — warm amber.
  carbs,

  /// Fat — soft rose.
  fat,

  /// Fiber — sage green.
  fiber,
}

/// Horizontal progress bar for a single macro nutrient.
class MacroProgressBar extends StatelessWidget {
  /// Creates a [MacroProgressBar].
  const MacroProgressBar({
    required this.macro,
    required this.consumed,
    required this.total,
    super.key,
    this.showLabel = true,
  });

  /// Macro type (drives color).
  final MacroType macro;

  /// Amount consumed.
  final double consumed;

  /// Daily target.
  final double total;

  /// Whether to show the label row above the bar.
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final progress = total > 0 ? (consumed / total).clamp(0.0, 1.0) : 0.0;
    final color = _color();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _label(),
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                '${consumed.toStringAsFixed(0)}g / ${total.toStringAsFixed(0)}g',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
        ClipRRect(
          borderRadius: AppRadius.pill,
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: AppColors.creamBorder,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  Color _color() => switch (macro) {
    MacroType.protein => AppColors.macroProtein,
    MacroType.carbs => AppColors.macroCarbs,
    MacroType.fat => AppColors.macroFat,
    MacroType.fiber => AppColors.macroFiber,
  };

  String _label() => switch (macro) {
    MacroType.protein => 'Protein',
    MacroType.carbs => 'Carbs',
    MacroType.fat => 'Fat',
    MacroType.fiber => 'Fiber',
  };
}
