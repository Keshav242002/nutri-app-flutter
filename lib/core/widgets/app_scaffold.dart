import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

/// Ahara design-system scaffold wrapper.
///
/// Applies consistent 20px horizontal padding, safe areas, and
/// Cream background across all screens.
class AppScaffold extends StatelessWidget {
  /// Creates an [AppScaffold].
  const AppScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset = true,
    this.padding,
    this.backgroundColor,
  });

  /// Screen body content.
  final Widget body;

  /// Optional app bar.
  final PreferredSizeWidget? appBar;

  /// Optional bottom navigation bar.
  final Widget? bottomNavigationBar;

  /// Optional FAB.
  final Widget? floatingActionButton;

  /// Whether to resize when the keyboard appears.
  final bool resizeToAvoidBottomInset;

  /// Override padding. Defaults to 20px horizontal.
  final EdgeInsetsGeometry? padding;

  /// Override background color. Defaults to [AppColors.cream].
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.cream,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        child: Padding(
          padding:
              padding ??
              const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenHorizontal,
              ),
          child: body,
        ),
      ),
    );
  }
}
