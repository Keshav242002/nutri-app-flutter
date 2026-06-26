import 'package:ahara/core/connectivity/connectivity_provider.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Wraps [child] and slides a thin "no internet" strip down from the top
/// whenever the device goes offline.
///
/// Driven by [connectivityStatusProvider]; while offline the repositories
/// serve cached data, and on reconnect the app refetches automatically
/// (see [onlineRefreshProvider]).
class OfflineBannerOverlay extends ConsumerWidget {
  /// Creates an [OfflineBannerOverlay] around [child].
  const OfflineBannerOverlay({required this.child, super.key});

  /// The app content shown beneath the banner.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Treat unknown/loading connectivity as online to avoid a false banner.
    final isOnline = ref.watch(connectivityStatusProvider).value ?? true;

    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 250),
              offset: isOnline ? const Offset(0, -1) : Offset.zero,
              child: const _OfflineStrip(),
            ),
          ),
        ),
      ],
    );
  }
}

class _OfflineStrip extends StatelessWidget {
  const _OfflineStrip();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.error,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off_rounded,
                size: 16,
                color: AppColors.white,
              ),
              const SizedBox(width: 8),
              Text(
                "You're offline — showing saved data",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
