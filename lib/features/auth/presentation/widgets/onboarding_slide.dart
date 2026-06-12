import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Data for a single onboarding slide.
class OnboardingSlideData {
  /// Creates [OnboardingSlideData].
  const OnboardingSlideData({
    required this.eyebrow,
    required this.headline,
    required this.body,
    required this.imagePath,
  });

  /// Small all-caps label — always Turmeric.
  final String eyebrow;

  /// Hero headline — DM Serif Display.
  final String headline;

  /// Supporting body text.
  final String body;

  /// Asset path for the slide image.
  final String imagePath;
}

/// Single onboarding slide: eyebrow + headline + body text.
///
/// Renders only the text content portion; the image panel and
/// progress pills are managed by the parent screen.
class OnboardingSlide extends StatelessWidget {
  /// Creates an [OnboardingSlide].
  const OnboardingSlide({required this.data, super.key});

  /// Slide content data.
  final OnboardingSlideData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data.eyebrow.toUpperCase(),
          style: AppTypography.eyebrow.copyWith(color: AppColors.turmeric),
        ),
        const SizedBox(height: 10),
        Text(
          data.headline,
          style: AppTypography.displayMedium.copyWith(
            color: AppColors.navyDeep,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          data.body,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            height: 1.55,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
