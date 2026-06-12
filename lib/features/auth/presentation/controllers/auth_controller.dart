import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:ahara/features/auth/domain/models/auth_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/providers.dart';
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
    final user = await fb.FirebaseAuth.instance.authStateChanges().first;
    if (user == null) return const AuthState.unauthenticated();
    return _loadUser(ref.read(authRepositoryProvider));
  }

  /// Refreshes user from the backend and updates state.
  Future<void> refresh() async {
    final firebaseUser = fb.FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      state = const AsyncData(AuthState.unauthenticated());
      return;
    }
    state = const AsyncLoading<AuthState>();
    state = AsyncData(await _loadUser(ref.read(authRepositoryProvider)));
  }

  /// Signs the user out and resets state to unauthenticated.
  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    state = const AsyncData(AuthState.unauthenticated());
  }

  /// Returns the authenticated [User] or `null`.
  User? get currentUser =>
      state.value?.maybeWhen(authenticated: (User u) => u, orElse: () => null);

  Future<AuthState> _loadUser(AuthRepository repo) async {
    final result = await repo.getCurrentUser();
    return result.when(
      success: AuthState.authenticated,
      failure: (_) => const AuthState.unauthenticated(),
    );
  }
}
