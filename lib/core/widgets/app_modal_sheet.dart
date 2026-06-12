import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:flutter/material.dart';

/// Bottom sheet base with 28px top corners and Cream background.
///
/// Use [AppModalSheet.show] to display or wrap content with this widget
/// when constructing a custom sheet.
class AppModalSheet extends StatelessWidget {
  /// Creates an [AppModalSheet].
  const AppModalSheet({required this.child, super.key, this.padding});

  /// Sheet content.
  final Widget child;

  /// Internal padding. Defaults to 28px top, 24px sides, 24px bottom.
  final EdgeInsetsGeometry? padding;

  /// Shows the sheet as a modal bottom sheet.
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (_) => AppModalSheet(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cream,
        borderRadius: AppRadius.bottomSheet,
      ),
      padding:
          padding ??
          EdgeInsets.only(
            top: 28,
            left: 24,
            right: 24,
            bottom: MediaQuery.viewInsetsOf(context).bottom + 24,
          ),
      child: child,
    );
  }
}
