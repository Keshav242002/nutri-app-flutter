import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/widgets/app_bottom_nav.dart';
import 'package:ahara/features/auth/domain/models/auth_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ahara/features/auth/presentation/screens/login_screen.dart';
import 'package:ahara/features/auth/presentation/screens/onboarding_slides_screen.dart';
import 'package:ahara/features/auth/presentation/screens/splash_screen.dart';
import 'package:ahara/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

// ---------------------------------------------------------------------------
// Placeholder screens — replaced in later features.
// ---------------------------------------------------------------------------

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(label)));
  }
}

/// Shell wrapping the bottom-nav tabs.
class _ShellScreen extends StatelessWidget {
  const _ShellScreen({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Error page — kept for unknown routes.
// ---------------------------------------------------------------------------

/// Shown when GoRouter encounters an unknown route.
class RouterErrorPage extends StatelessWidget {
  /// Creates the [RouterErrorPage].
  const RouterErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: const Center(child: Text('404 — Route not found')),
    );
  }
}

// ---------------------------------------------------------------------------
// Transition helper
// ---------------------------------------------------------------------------

/// All route changes use a plain crossfade to avoid platform-default slide /
/// fade-up transitions that flash white between screens.
CustomTransitionPage<void> _fadePage(Widget child) =>
    CustomTransitionPage<void>(
      child: child,

      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child),
    );

// ---------------------------------------------------------------------------
// Router provider
// ---------------------------------------------------------------------------

/// Provides the [GoRouter] instance used by the app.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final authState = ref.watch<AsyncValue<AuthState>>(authControllerProvider);

  return GoRouter(
    initialLocation: RoutePaths.splash,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) =>
        _redirect(authState, state),
    errorBuilder: (_, __) => const RouterErrorPage(),
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        pageBuilder: (_, __) => _fadePage(const SplashScreen()),
      ),
      GoRoute(
        path: RoutePaths.onboardingIntro,
        pageBuilder: (_, __) => _fadePage(const OnboardingSlidesScreen()),
      ),
      GoRoute(
        path: RoutePaths.login,
        pageBuilder: (_, __) => _fadePage(const LoginScreen()),
      ),
      GoRoute(
        path: RoutePaths.onboarding,
        pageBuilder: (_, __) => _fadePage(
          const _PlaceholderScreen(label: 'Onboarding questionnaire'),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, __, shell) => _ShellScreen(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                pageBuilder: (_, __) => _fadePage(const HomeScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.recipes,
                pageBuilder: (_, __) =>
                    _fadePage(const _PlaceholderScreen(label: 'Recipes')),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.tracker,
                pageBuilder: (_, __) =>
                    _fadePage(const _PlaceholderScreen(label: 'Tracker')),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                pageBuilder: (_, __) =>
                    _fadePage(const _PlaceholderScreen(label: 'Profile')),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

// ---------------------------------------------------------------------------
// Redirect logic
// ---------------------------------------------------------------------------

/// Returns a redirect path or `null` to allow navigation.
///
/// Rules:
/// 1. Auth loading → stay on splash; block all other routes.
/// 2. Unauthenticated → allow splash / onboarding-intro / login only.
/// 3. Authenticated without profile → redirect to onboarding questionnaire.
/// 4. Authenticated with profile → redirect away from auth routes to home.
String? _redirect(AsyncValue<AuthState> authState, GoRouterState state) {
  final location = state.uri.path;

  if (authState.isLoading || authState.value == null) {
    if (location == RoutePaths.splash) return null;
    return RoutePaths.splash;
  }

  return authState.value!.when(
    unauthenticated: () => _redirectUnauthenticated(location),
    authenticated: (User user) => _redirectAuthenticated(user, location),
    loading: () {
      if (location == RoutePaths.splash) return null;
      return RoutePaths.splash;
    },
  );
}

String? _redirectUnauthenticated(String location) {
  const publicPaths = {
    RoutePaths.splash,
    RoutePaths.onboardingIntro,
    RoutePaths.login,
  };
  if (publicPaths.contains(location)) return null;
  return RoutePaths.login;
}

String? _redirectAuthenticated(User user, String location) {
  // Splash is excluded intentionally: the animation plays to completion and
  // calls context.go() itself. Auto-redirecting here would cut the animation
  // short and cause a white-frame flash on the transition.
  const authOnlyPaths = {
    RoutePaths.login,
    RoutePaths.onboardingIntro,
  };
  if (authOnlyPaths.contains(location)) return RoutePaths.home;
  return null;
}
