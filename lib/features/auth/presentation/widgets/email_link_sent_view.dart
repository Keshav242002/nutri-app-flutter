import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

/// "Check your email" confirmation view shown after the email link is sent.
///
/// Replaces the design's 6-digit OTP UI because the backend has no
/// custom OTP endpoints — Firebase Email Link is used instead.
class EmailLinkSentView extends StatelessWidget {
  /// Creates an [EmailLinkSentView].
  const EmailLinkSentView({
    required this.email,
    required this.resendCountdown,
    required this.onResend,
    super.key,
    this.isResending = false,
  });

  /// The email address the link was sent to.
  final String email;

  /// Seconds remaining before the user can resend.
  final int resendCountdown;

  /// Called when the user taps "Resend OTP".
  final VoidCallback onResend;

  /// Shows a spinner on the resend button when `true`.
  final bool isResending;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Check your email',
          style: AppTypography.displayMedium.copyWith(
            color: AppColors.navyDeep,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            children: [
              const TextSpan(text: 'We sent a sign-in link to '),
              TextSpan(
                text: email,
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.navyDeep,
                ),
              ),
              const TextSpan(text: '. Tap the link in the email to sign in.'),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Icon(
          Icons.mark_email_unread_outlined,
          size: 64,
          color: AppColors.turmeric,
        ),
        const SizedBox(height: 32),
        if (resendCountdown > 0)
          Center(
            child: Text(
              'Resend in 0:${resendCountdown.toString().padLeft(2, '0')}',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textHint,
              ),
            ),
          )
        else
          AppButton(
            label: 'Resend link',
            onPressed: onResend,
            isLoading: isResending,
            variant: AppButtonVariant.secondary,
          ),
      ],
    );
  }
}
