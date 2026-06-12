import 'package:ahara/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// Provides the [GoRouter] instance for the app.
///
/// F0: Single placeholder route at [RoutePaths.home].
// TODO(F1): Add splash, login, signup routes + redirect guards.
// TODO(F1): Wrap tab routes in ShellRoute with AppBottomNav.
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: RoutePaths.home,
    debugLogDiagnostics: true,
    redirect: _redirectGuard,
    routes: [
      GoRoute(
        path: RoutePaths.home,
        name: 'home',
        builder: (context, state) => const PlaceholderHomePage(),
      ),
    ],
    errorBuilder: (context, state) => const PlaceholderErrorPage(),
  );
}

/// Redirect guard stub.
// TODO(F1): Implement auth + profile gate:
// - Not logged in → /login
// - Logged in but no profile (PROFILE_NOT_FOUND) → /onboarding
// - Logged in + onboarded → matched route (default /home)
String? _redirectGuard(BuildContext context, GoRouterState state) {
  // TODO(F1): Implement redirect logic.
  return null;
}

/// Placeholder home page for F0.
///
/// Replaced with the real Dashboard in F3.
class PlaceholderHomePage extends StatelessWidget {
  /// Creates the placeholder home page.
  const PlaceholderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ahara'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu,
              size: 64,
              color: Colors.orange,
            ),
            SizedBox(height: 16),
            Text(
              'Ahara',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Your weekly Indian meal plan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'F0 — Foundation scaffold running ✓',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Placeholder error page for unknown routes.
class PlaceholderErrorPage extends StatelessWidget {
  /// Creates the placeholder error page.
  const PlaceholderErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: const Center(
        child: Text('404 — Route not found'),
      ),
    );
  }
}
