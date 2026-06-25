import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:ahara/features/auth/domain/models/login_form_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/presentation/controllers/login_controller.dart';
import 'package:ahara/features/auth/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

const _kUser = User(
  id: 1,
  email: 'a@b.com',
  firebaseUid: 'uid-1',
  displayName: 'A',
  hasProfile: false,
);

class _FakeRepo extends Fake implements AuthRepository {
  @override
  Future<Result<User>> signInWithGoogle() async => const Success(_kUser);
}

ProviderContainer _container({AuthRepository? repo}) {
  return ProviderContainer(
    overrides: [authRepositoryProvider.overrideWithValue(repo ?? _FakeRepo())],
  );
}

void main() {
  group('LoginController', () {
    test('build() starts in chooseMethod state', () {
      final c = _container();
      addTearDown(c.dispose);
      expect(
        c.read(loginControllerProvider),
        equals(const LoginFormState.chooseMethod()),
      );
    });

    test('selectEmail() → emailPasswordEntry with empty fields', () {
      final c = _container();
      addTearDown(c.dispose);
      c.read(loginControllerProvider.notifier).selectEmail();
      expect(
        c.read(loginControllerProvider),
        equals(const LoginFormState.emailPasswordEntry(
          email: '',
          password: '',
          isSignUpMode: false,
        )),
      );
    });

    test('goBack() returns to chooseMethod', () {
      final c = _container();
      addTearDown(c.dispose);
      c.read(loginControllerProvider.notifier).selectEmail();
      c.read(loginControllerProvider.notifier).goBack();
      expect(
        c.read(loginControllerProvider),
        equals(const LoginFormState.chooseMethod()),
      );
    });

    test('toggleSignUpMode flips isSignUpMode within emailPasswordEntry', () {
      final c = _container();
      addTearDown(c.dispose);
      c.read(loginControllerProvider.notifier).selectEmail();
      c.read(loginControllerProvider.notifier).toggleSignUpMode();
      final isSignUp = c
          .read(loginControllerProvider)
          .maybeWhen(
            emailPasswordEntry: (_, __, mode, ___) => mode,
            orElse: () => false,
          );
      expect(isSignUp, isTrue);
    });
  });
}
