import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Eyebrow + headline section header per the Ahara design system.
class SectionHeader extends StatelessWidget {
  /// Creates a [SectionHeader].
  const SectionHeader({required this.headline, super.key, this.eyebrow});

  /// Small all-caps label above the headline. Rendered in Turmeric.
  final String? eyebrow;

  /// Main headline text.
  final String headline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (eyebrow != null) ...[
          Text(
            eyebrow!.toUpperCase(),
            style: AppTypography.eyebrow.copyWith(color: AppColors.turmeric),
          ),
          const SizedBox(height: 4),
        ],
        Text(
          headline,
          style: AppTypography.displayMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
