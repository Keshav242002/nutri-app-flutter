import 'dart:async';
import 'dart:developer' as dev;

import 'package:ahara/core/cache/cache_service.dart';
import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/notifications/push_messaging_service.dart';
import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:ahara/features/auth/domain/models/auth_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/providers.dart';
import 'package:ahara/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:ahara/features/notifications/presentation/controllers/push_settings_controller.dart';
import 'package:ahara/features/notifications/presentation/controllers/unread_count_controller.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

/// Manages the global auth state of the app.
///
/// Listens to Firebase auth changes and keeps the backend user record
/// in sync. Kept alive so auth state survives navigation.
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  Future<AuthState> build() async {
    final fbUser = await fb.FirebaseAuth.instance.authStateChanges().first;
    if (fbUser == null) return const AuthState.unauthenticated();
    final authState = await _loadUser(ref.read(authRepositoryProvider), fbUser);
    authState.maybeWhen(
      authenticated: (_) => unawaited(_onAuthenticated()),
      orElse: () {},
    );
    return authState;
  }

  /// Initializes push messaging and registers the FCM token if the user has
  /// opted in. Safe to call on every authenticated session.
  Future<void> _onAuthenticated() async {
    await ref.read(pushMessagingServiceProvider).init();
    await ref.read(pushSettingsControllerProvider.notifier).initOnLaunch();
  }

  /// Refreshes user from the backend and updates state.
  ///
  /// Intentionally skips AsyncLoading to avoid triggering the splash redirect.
  Future<void> refresh() async {
    final firebaseUser = fb.FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      state = const AsyncData(AuthState.unauthenticated());
      return;
    }
    state = AsyncData(
      await _loadUser(ref.read(authRepositoryProvider), firebaseUser),
    );
  }

  /// Updates the current user's display name and refreshes state.
  Future<void> updateDisplayName(String name) async {
    final result = await ref
        .read(authRepositoryProvider)
        .updateDisplayName(name);
    result.when(
      success: (User user) => state = AsyncData(AuthState.authenticated(user)),
      failure: (_) {},
    );
  }

  /// Signs the user out and resets state to unauthenticated.
  Future<void> signOut() async {
    // Unregister the FCM token while the session is still valid (the DELETE
    // needs the auth header).
    await ref
        .read(pushSettingsControllerProvider.notifier)
        .unregisterOnSignOut();
    await ref.read(authRepositoryProvider).signOut();
    state = const AsyncData(AuthState.unauthenticated());

    // Clear the previous user's cached state so the next account doesn't see
    // it. These are keepAlive providers, so they survive navigation and would
    // otherwise leak across accounts until an app restart.
    ref
      ..invalidate(dashboardControllerProvider)
      ..invalidate(unreadCountControllerProvider)
      ..invalidate(pushSettingsControllerProvider);

    // Wipe the Hive offline cache — it is keyed by endpoint path, not by user,
    // so without this the next account briefly sees the previous user's data.
    await ref.read(cacheServiceProvider).clearAll();
  }

  /// Immediately marks the session as authenticated with [user].
  ///
  /// Called after a successful sign-in so the router redirect sees the
  /// correct state before navigation fires.
  void setAuthenticated(User user) {
    state = AsyncData(AuthState.authenticated(user));
    unawaited(_onAuthenticated());
  }

  /// Returns the authenticated [User] or `null`.
  User? get currentUser =>
      state.value?.maybeWhen(authenticated: (User u) => u, orElse: () => null);

  Future<AuthState> _loadUser(AuthRepository repo, fb.User fbUser) async {
    final result = await repo.getCurrentUser();
    return result.when(
      success: AuthState.authenticated,
      failure: (AppException e) {
        if (e is UnauthorizedException) {
          return const AuthState.unauthenticated();
        }
        dev.log(
          'getCurrentUser failed (${e.runtimeType}): ${e.message}'
          ' — keeping Firebase session',
          name: 'Auth',
        );
        return AuthState.authenticated(
          User(
            id: 0,
            email: fbUser.email ?? '',
            firebaseUid: fbUser.uid,
            displayName: fbUser.displayName ?? '',
            hasProfile: true,
          ),
        );
      },
    );
  }
}
