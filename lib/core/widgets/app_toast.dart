import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Root overlay widget that renders the app-wide toast on top of all content.
///
/// Wrap [MaterialApp.router]'s `builder` with this widget so toasts appear
/// above every screen, navigation transition, and bottom sheet.
///
/// Usage:
/// ```dart
/// MaterialApp.router(
///   builder: (context, child) => ToastOverlay(child: child!),
/// )
/// ```
///
/// To show a toast from anywhere:
/// ```dart
/// ref.read(toastProvider.notifier).show('Something went wrong');
/// ref.read(toastProvider.notifier).show('Saved!', type: ToastType.success);
/// ```
class ToastOverlay extends ConsumerWidget {
  /// Creates a [ToastOverlay].
  const ToastOverlay({required this.child, super.key});

  /// The wrapped app content (typically the router's navigator).
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider);
    final safeTop = MediaQuery.paddingOf(context).top;

    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        Positioned(
          top: safeTop + AppSpacing.sm,
          left: AppSpacing.md,
          right: AppSpacing.md,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -1.5),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: toast != null
                ? _ToastBanner(key: ValueKey(toast.hashCode), toast: toast)
                : const SizedBox.shrink(key: ValueKey('empty')),
          ),
        ),
      ],
    );
  }
}

class _ToastBanner extends StatelessWidget {
  const _ToastBanner({required this.toast, super.key});

  final ToastMessage toast;

  @override
  Widget build(BuildContext context) {
    final isError = toast.type == ToastType.error;

    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(12),
      color: isError ? AppColors.error : AppColors.success,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: 12,
        ),
        child: Row(
          children: [
            Icon(
              isError
                  ? Icons.error_outline_rounded
                  : Icons.check_circle_outline_rounded,
              color: AppColors.white,
              size: 20,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                toast.message,
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
