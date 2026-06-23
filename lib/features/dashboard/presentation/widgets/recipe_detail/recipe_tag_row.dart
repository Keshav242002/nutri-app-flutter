import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Labelled row of pill tags (e.g. diet or allergen tags).
class RecipeTagRow extends StatelessWidget {
  /// Creates a [RecipeTagRow].
  const RecipeTagRow({required this.label, required this.tags, super.key});

  /// Label shown before the tags (e.g. "Diet", "Allergens").
  final String label;

  /// Tag strings to render as pills.
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, right: AppSpacing.sm),
          child: Text(
            '$label:',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: tags.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.turmeric.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  t,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.turmeric,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
