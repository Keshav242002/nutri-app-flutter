import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_detail.dart';
import 'package:flutter/material.dart';

/// Horizontal row of chips showing prep time, servings, difficulty, spice.
class RecipeMetaRow extends StatelessWidget {
  /// Creates a [RecipeMetaRow].
  const RecipeMetaRow({required this.recipe, super.key});

  /// Recipe data to display.
  final RecipeDetail recipe;

  @override
  Widget build(BuildContext context) {
    final totalMin = recipe.prepTimeMin + recipe.cookTimeMin;
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.xs,
      children: [
        _Chip(icon: Icons.timer_outlined, label: '$totalMin min'),
        _Chip(
          icon: Icons.people_outline_rounded,
          label: '${recipe.servings} servings',
        ),
        _Chip(
          icon: Icons.bar_chart_rounded,
          label: recipe.estimatedDifficulty,
        ),
        _Chip(
          icon: Icons.local_fire_department_outlined,
          label: recipe.spiceLevel,
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
