import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/macro_progress_bar.dart';
import 'package:ahara/features/dashboard/domain/models/nutrition_summary.dart';
import 'package:flutter/material.dart';

/// Card showing average weekly macro bars (protein, carbs, fat, fiber).
class MacroAveragesCard extends StatelessWidget {
  /// Creates a [MacroAveragesCard].
  const MacroAveragesCard({
    required this.averages,
    required this.targets,
    super.key,
  });

  /// Average daily macro values for the week.
  final NutritionSummary averages;

  /// Daily macro targets (from the user's dietary profile).
  final NutritionSummary? targets;

  @override
  Widget build(BuildContext context) {
    final t = targets ?? const NutritionSummary();
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Macro Averages',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          MacroProgressBar(
            macro: MacroType.protein,
            consumed: averages.proteinG,
            total: t.proteinG,
          ),
          const SizedBox(height: AppSpacing.sm),
          MacroProgressBar(
            macro: MacroType.carbs,
            consumed: averages.carbsG,
            total: t.carbsG,
          ),
          const SizedBox(height: AppSpacing.sm),
          MacroProgressBar(
            macro: MacroType.fat,
            consumed: averages.fatG,
            total: t.fatG,
          ),
          const SizedBox(height: AppSpacing.sm),
          MacroProgressBar(
            macro: MacroType.fiber,
            consumed: averages.fiberG,
            total: t.fiberG,
          ),
        ],
      ),
    );
  }
}
