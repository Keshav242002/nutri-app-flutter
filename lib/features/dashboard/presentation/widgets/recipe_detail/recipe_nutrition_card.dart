import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/dashboard/domain/models/nutrition_summary.dart';
import 'package:flutter/material.dart';

/// Card showing per-serving macro breakdown for a recipe.
class RecipeNutritionCard extends StatelessWidget {
  /// Creates a [RecipeNutritionCard].
  const RecipeNutritionCard({required this.nutrition, super.key});

  /// Nutrition data to display.
  final NutritionSummary nutrition;

  @override
  Widget build(BuildContext context) {
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
            'Nutrition per serving',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.navyDeep,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _MacroCell(
                label: 'Calories',
                value: nutrition.calories.round().toString(),
                unit: 'kcal',
                color: AppColors.turmeric,
              ),
              _MacroCell(
                label: 'Protein',
                value: nutrition.proteinG.toStringAsFixed(1),
                unit: 'g',
                color: AppColors.macroProtein,
              ),
              _MacroCell(
                label: 'Carbs',
                value: nutrition.carbsG.toStringAsFixed(1),
                unit: 'g',
                color: AppColors.macroCarbs,
              ),
              _MacroCell(
                label: 'Fat',
                value: nutrition.fatG.toStringAsFixed(1),
                unit: 'g',
                color: AppColors.macroFat,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroCell extends StatelessWidget {
  const _MacroCell({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  final String label;
  final String value;
  final String unit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.headingMedium.copyWith(color: color),
        ),
        Text(
          unit,
          style: AppTypography.caption.copyWith(color: color),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: AppTypography.caption.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
