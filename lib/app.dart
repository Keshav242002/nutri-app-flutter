import 'package:ahara/core/routing/app_router.dart';
import 'package:ahara/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Root widget of the Ahara app.
///
/// Uses [MaterialApp.router] with the router from [routerProvider].
/// Theme is applied from [AppTheme] (populated in F1).
class AharaApp extends ConsumerWidget {
  /// Creates the root app widget.
  const AharaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Ahara',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routerConfig: router,
    );
  }
}
