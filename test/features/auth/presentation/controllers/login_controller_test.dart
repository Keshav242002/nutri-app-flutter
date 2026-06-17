import 'package:ahara/core/network/api_exceptions.dart';
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
  _FakeRepo({this.sendLinkError});
  final AppException? sendLinkError;

  @override
  Future<Result<void>> sendEmailLink(String email, String continueUrl) async {
    if (sendLinkError != null) return Failure(sendLinkError!);
    return const Success(null);
  }

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

    test('updateEmail with valid address → isValid=true', () {
      final c = _container();
      addTearDown(c.dispose);
      c.read(loginControllerProvider.notifier).updateEmail('user@example.com');
      final isValid = c
          .read(loginControllerProvider)
          .maybeWhen(emailEntry: (_, v, __) => v, orElse: () => false);
      expect(isValid, isTrue);
    });

    test('updateEmail with invalid address → isValid=false', () {
      final c = _container();
      addTearDown(c.dispose);
      c.read(loginControllerProvider.notifier).updateEmail('not-an-email');
      final isValid = c
          .read(loginControllerProvider)
          .maybeWhen(emailEntry: (_, v, __) => v, orElse: () => true);
      expect(isValid, isFalse);
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

    test('sendEmailLink success → emailLinkSent with countdown 45', () async {
      final c = _container();
      addTearDown(c.dispose);
      await c
          .read(loginControllerProvider.notifier)
          .sendEmailLink('user@example.com');
      final countdown = c
          .read(loginControllerProvider)
          .maybeWhen(emailLinkSent: (_, n) => n, orElse: () => -1);
      expect(countdown, equals(45));
    });

    test('sendEmailLink failure → error state', () async {
      final c = _container(
        repo: _FakeRepo(sendLinkError: const NetworkException()),
      );
      addTearDown(c.dispose);
      await c
          .read(loginControllerProvider.notifier)
          .sendEmailLink('user@example.com');
      final isError = c
          .read(loginControllerProvider)
          .maybeWhen(error: (_) => true, orElse: () => false);
      expect(isError, isTrue);
    });

    test('tickResendCountdown decrements by 1', () async {
      final c = _container();
      addTearDown(c.dispose);
      await c
          .read(loginControllerProvider.notifier)
          .sendEmailLink('user@example.com');
      c
          .read(loginControllerProvider.notifier)
          .tickResendCountdown('user@example.com', 45);
      final countdown = c
          .read(loginControllerProvider)
          .maybeWhen(emailLinkSent: (_, n) => n, orElse: () => -1);
      expect(countdown, equals(44));
    });

    test('tickResendCountdown at 0 does not decrement further', () async {
      final c = _container();
      addTearDown(c.dispose);
      await c
          .read(loginControllerProvider.notifier)
          .sendEmailLink('user@example.com');
      c
          .read(loginControllerProvider.notifier)
          .tickResendCountdown('user@example.com', 0);
      // After tick at 0 the state is unchanged — still 45 from sendEmailLink.
      final countdown = c
          .read(loginControllerProvider)
          .maybeWhen(emailLinkSent: (_, n) => n, orElse: () => -1);
      expect(countdown, equals(45));
    });
  });
}
