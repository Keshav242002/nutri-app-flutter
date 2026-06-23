import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_detail.dart';
import 'package:flutter/material.dart';

/// Bulleted list of recipe ingredients with quantity.
class RecipeIngredientList extends StatelessWidget {
  /// Creates a [RecipeIngredientList].
  const RecipeIngredientList({required this.ingredients, super.key});

  /// Ingredients to display.
  final List<RecipeIngredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients
          .map((ing) => _IngredientRow(ingredient: ing))
          .toList(),
    );
  }
}

class _IngredientRow extends StatelessWidget {
  const _IngredientRow({required this.ingredient});

  final RecipeIngredient ingredient;

  @override
  Widget build(BuildContext context) {
    final qty = ingredient.displayQuantity;
    final unit = ingredient.displayUnitName ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: AppSpacing.sm, top: 2),
            decoration: const BoxDecoration(
              color: AppColors.turmeric,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              ingredient.ingredientName,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.navyDeep,
              ),
            ),
          ),
          Text(
            unit.isEmpty ? qty : '$qty $unit',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
