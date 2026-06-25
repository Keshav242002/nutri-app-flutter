import 'package:ahara/core/routing/app_router.dart';
import 'package:ahara/core/theme/app_theme.dart';
import 'package:ahara/core/widgets/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Root widget of the Ahara app.
///
/// Uses [MaterialApp.router] with the router from [appRouterProvider].
/// Theme is applied from [AppTheme].
class AharaApp extends ConsumerWidget {
  /// Creates the root app widget.
  const AharaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch<GoRouter>(appRouterProvider);

    return MaterialApp.router(
      title: 'Ahara',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
      builder: (context, child) =>
          ToastOverlay(child: child ?? const SizedBox.shrink()),
    );
  }
}
