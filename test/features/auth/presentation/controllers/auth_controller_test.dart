import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:ahara/features/auth/domain/models/auth_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ahara/features/auth/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

const _kUser = User(
  id: 1,
  email: 'user@test.com',
  firebaseUid: 'fb-uid',
  displayName: 'Test',
  hasProfile: true,
);

class _FakeRepo extends Fake implements AuthRepository {
  _FakeRepo({required this.userResult});
  final Result<User> userResult;

  @override
  Future<Result<User>> getCurrentUser() async => userResult;

  @override
  Future<Result<void>> signOut() async => const Success(null);
}

/// Bypasses FirebaseAuth by building from a pre-set state.
class _FakeAuthController extends AuthController {
  _FakeAuthController(this._initial);
  final AuthState _initial;

  @override
  Future<AuthState> build() async => _initial;
}

ProviderContainer _container({
  AuthState initial = const AuthState.unauthenticated(),
  AuthRepository? repo,
}) {
  return ProviderContainer(
    overrides: [
      authControllerProvider.overrideWith(() => _FakeAuthController(initial)),
      if (repo != null) authRepositoryProvider.overrideWithValue(repo),
    ],
  );
}

void main() {
  group('AuthController', () {
    test('initialises as unauthenticated by default', () async {
      final c = _container();
      addTearDown(c.dispose);
      final state = await c.read(authControllerProvider.future);
      expect(state, equals(const AuthState.unauthenticated()));
    });

    test('initialises as authenticated when user is provided', () async {
      final c = _container(initial: const AuthState.authenticated(_kUser));
      addTearDown(c.dispose);
      final state = await c.read(authControllerProvider.future);
      final isAuthenticated = state.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );
      expect(isAuthenticated, isTrue);
    });

    test('currentUser returns null when unauthenticated', () async {
      final c = _container();
      addTearDown(c.dispose);
      await c.read(authControllerProvider.future);
      expect(c.read(authControllerProvider.notifier).currentUser, isNull);
    });

    test('currentUser returns user when authenticated', () async {
      final c = _container(initial: const AuthState.authenticated(_kUser));
      addTearDown(c.dispose);
      await c.read(authControllerProvider.future);
      expect(
        c.read(authControllerProvider.notifier).currentUser,
        equals(_kUser),
      );
    });

    test('signOut() transitions to unauthenticated', () async {
      final repo = _FakeRepo(userResult: const Success(_kUser));
      final c = _container(
        initial: const AuthState.authenticated(_kUser),
        repo: repo,
      );
      addTearDown(c.dispose);
      await c.read(authControllerProvider.future);
      await c.read(authControllerProvider.notifier).signOut();
      final state = await c.read(authControllerProvider.future);
      expect(state, equals(const AuthState.unauthenticated()));
    });
  });
}
