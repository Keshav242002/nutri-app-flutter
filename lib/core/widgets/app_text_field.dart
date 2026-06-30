import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Ahara design-system text field.
///
/// Cream Deep fill, Navy border on focus, 52px tall, 12px radius.
class AppTextField extends StatelessWidget {
  /// Creates an [AppTextField].
  const AppTextField({
    required this.controller,
    super.key,
    this.placeholder,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.focusNode,
  });

  /// Text editing controller.
  final TextEditingController controller;

  /// Placeholder hint text.
  final String? placeholder;

  /// Keyboard type.
  final TextInputType? keyboardType;

  /// IME action on the keyboard.
  final TextInputAction? textInputAction;

  /// Called on each keystroke.
  final ValueChanged<String>? onChanged;

  /// Called when the user submits.
  final ValueChanged<String>? onSubmitted;

  /// Validation error message shown below the field.
  final String? errorText;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Auto-focuses when `true`.
  final bool autofocus;

  /// Obscures text (password mode).
  final bool obscureText;

  /// Optional leading icon.
  final Widget? prefixIcon;

  /// Optional trailing icon.
  final Widget? suffixIcon;

  /// Whether the field is interactive.
  final bool enabled;

  /// Optional focus node for manual focus management.
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      readOnly: readOnly,
      autofocus: autofocus,
      obscureText: obscureText,
      enabled: enabled,
      autocorrect: false,
      enableSuggestions: false,
      style: AppTypography.bodyLarge.copyWith(
        color: enabled ? AppColors.textPrimary : AppColors.textHint,
      ),
      cursorColor: AppColors.navyDeep,
      decoration: InputDecoration(
        hintText: placeholder,
        errorText: errorText,
        errorStyle: AppTypography.caption.copyWith(color: AppColors.error),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        constraints: const BoxConstraints(minHeight: 52),
      ),
    );
  }
}
