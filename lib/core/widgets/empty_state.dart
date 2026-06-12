import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

/// Full-area empty state widget.
///
/// Illustration slot + message + optional CTA button.
class EmptyState extends StatelessWidget {
  /// Creates an [EmptyState].
  const EmptyState({
    required this.message,
    super.key,
    this.illustration,
    this.ctaLabel,
    this.onCta,
  });

  /// Primary message.
  final String message;

  /// Optional illustration widget (icon, image, etc.).
  final Widget? illustration;

  /// CTA button label. Requires [onCta].
  final String? ctaLabel;

  /// CTA callback.
  final VoidCallback? onCta;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (illustration != null) ...[
              illustration!,
              const SizedBox(height: 24),
            ],
            Text(
              message,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (ctaLabel != null && onCta != null) ...[
              const SizedBox(height: 24),
              AppButton(label: ctaLabel!, onPressed: onCta),
            ],
          ],
        ),
      ),
    );
  }
}
