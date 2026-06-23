import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Bold navy section heading used between recipe content blocks.
class RecipeSectionTitle extends StatelessWidget {
  /// Creates a [RecipeSectionTitle].
  const RecipeSectionTitle({required this.title, super.key});

  /// Section heading text.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTypography.headingMedium.copyWith(color: AppColors.navyDeep),
    );
  }
}
