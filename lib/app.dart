import 'package:ahara/core/providers/app_lifecycle_provider.dart';
import 'package:ahara/core/routing/app_router.dart';
import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_theme.dart';
import 'package:ahara/core/widgets/app_toast.dart';
import 'package:ahara/core/widgets/offline_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const _kBackgroundTimeout = Duration(minutes: 10);

/// Root widget of the Ahara app.
///
/// Monitors app lifecycle: if the app spends ≥ 10 min in background,
/// navigation resets to splash so the auth-gate flow reruns.
class AharaApp extends ConsumerStatefulWidget {
  const AharaApp({super.key});

  @override
  ConsumerState<AharaApp> createState() => _AharaAppState();
}

class _AharaAppState extends ConsumerState<AharaApp>
    with WidgetsBindingObserver {
  DateTime? _pausedAt;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      // `hidden` fires on Android before `paused` on some API levels —
      // capture whichever comes first without overwriting an earlier stamp.
      _pausedAt ??= DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      final paused = _pausedAt;
      if (paused != null &&
          DateTime.now().difference(paused) >= _kBackgroundTimeout) {
        ref.read(appLifecycleProvider.notifier).trigger();
      }
      _pausedAt = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch<GoRouter>(appRouterProvider);

    ref.listen<bool>(appLifecycleProvider, (_, shouldReset) {
      if (shouldReset) {
        ref.read(appLifecycleProvider.notifier).clearReset();
        router.go(RoutePaths.splash);
      }
    });

    return MaterialApp.router(
      title: 'Ahara',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
      builder: (context, child) => OfflineBannerOverlay(
        child: ToastOverlay(child: child ?? const SizedBox.shrink()),
      ),
    );
  }
}
