import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Numbered list of recipe instructions.
class RecipeInstructionList extends StatelessWidget {
  /// Creates a [RecipeInstructionList].
  const RecipeInstructionList({required this.steps, super.key});

  /// Ordered instruction steps.
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: steps.asMap().entries.map((entry) {
        return _InstructionStep(number: entry.key + 1, text: entry.value);
      }).toList(),
    );
  }
}

class _InstructionStep extends StatelessWidget {
  const _InstructionStep({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: AppSpacing.sm),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.turmeric.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: AppTypography.caption.copyWith(
                color: AppColors.turmeric,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.navyDeep,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
