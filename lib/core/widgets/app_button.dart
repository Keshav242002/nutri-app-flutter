import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Visual variant of [AppButton].
enum AppButtonVariant {
  /// Turmeric background — primary CTA.
  primary,

  /// Navy background — secondary action.
  secondary,

  /// Transparent with text only.
  text,

  /// Error-red — destructive actions.
  destructive,
}

/// Ahara design-system button.
///
/// 52px tall, 12px radius. Supports loading spinner state.
class AppButton extends StatelessWidget {
  /// Creates an [AppButton].
  const AppButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.icon,
  });

  /// Button label text.
  final String label;

  /// Callback fired on tap. Set `null` to disable.
  final VoidCallback? onPressed;

  /// Visual variant.
  final AppButtonVariant variant;

  /// Shows a spinner inside the button when `true`.
  final bool isLoading;

  /// Optional leading icon widget.
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final bg = _backgroundColor();
    final fg = _foregroundColor();

    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          disabledBackgroundColor: variant == AppButtonVariant.primary
              ? AppColors.creamBorder
              : bg?.withValues(alpha: 0.5),
          disabledForegroundColor: AppColors.textHint,
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.button),
          side: variant == AppButtonVariant.secondary
              ? const BorderSide(color: AppColors.navyDeep)
              : null,
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: fg),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[icon!, const SizedBox(width: 10)],
                  Text(
                    label,
                    style: AppTypography.labelLarge.copyWith(color: fg),
                  ),
                ],
              ),
      ),
    );
  }

  Color? _backgroundColor() => switch (variant) {
    AppButtonVariant.primary => AppColors.turmeric,
    AppButtonVariant.secondary => AppColors.navyDeep,
    AppButtonVariant.destructive => AppColors.error,
    AppButtonVariant.text => Colors.transparent,
  };

  Color _foregroundColor() => switch (variant) {
    AppButtonVariant.primary => AppColors.navyDeep,
    AppButtonVariant.secondary => AppColors.white,
    AppButtonVariant.destructive => AppColors.white,
    AppButtonVariant.text => AppColors.textSecondary,
  };
}
