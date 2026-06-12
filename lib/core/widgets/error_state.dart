import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

/// Full-area error state widget.
///
/// Maps every [AppException] subtype to a user-facing message.
/// Displays a retry button when [onRetry] is provided.
class ErrorState extends StatelessWidget {
  /// Creates an [ErrorState] from an [AppException].
  const ErrorState({required this.exception, super.key, this.onRetry});

  /// The error to display.
  final AppException exception;

  /// Optional retry callback.
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: AppColors.error,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              _userMessage(),
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              AppButton(label: 'Try again', onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }

  String _userMessage() => switch (exception) {
    NetworkException() => 'No internet connection. Please check your network.',
    TimeoutException() => 'Request timed out. Please try again.',
    UnauthorizedException() => 'Session expired. Please sign in again.',
    ValidationException() => exception.message,
    NotFoundException() => 'The requested resource was not found.',
    RateLimitException() => 'Too many requests. Please wait a moment.',
    ServerException() => 'Something went wrong on our end. Please try again.',
    UnknownException() => 'An unexpected error occurred. Please try again.',
  };
}
