import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:ahara/features/auth/domain/models/login_form_state.dart';
import 'package:ahara/features/auth/presentation/controllers/login_controller.dart';
import 'package:ahara/features/auth/presentation/screens/login_screen.dart';
import 'package:ahara/features/auth/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeRepo extends Fake implements AuthRepository {}

/// Fake notifier for direct state injection in widget tests.
class _FakeLoginController extends LoginController {
  _FakeLoginController(this._state);
  final LoginFormState _state;

  @override
  LoginFormState build() => _state;
}

Widget _wrap({
  LoginFormState state = const LoginFormState.chooseMethod(),
  AuthRepository? repo,
}) {
  return ProviderScope(
    overrides: [
      loginControllerProvider.overrideWith(() => _FakeLoginController(state)),
      authRepositoryProvider.overrideWithValue(repo ?? _FakeRepo()),
    ],
    child: const MaterialApp(home: LoginScreen()),
  );
}

void main() {
  group('LoginScreen — chooseMethod state', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('shows Continue with Google button', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.textContaining('Google'), findsOneWidget);
    });

    testWidgets('shows Continue with email button', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.textContaining('Continue with email'), findsOneWidget);
    });
  });

  group('LoginScreen — emailPasswordEntry state', () {
    testWidgets('shows email and password fields', (tester) async {
      await tester.pumpWidget(
        _wrap(
          state: const LoginFormState.emailPasswordEntry(
            email: 'hello@example.com',
            password: '',
            isSignUpMode: false,
          ),
        ),
      );
      expect(find.byType(TextField), findsNWidgets(2));
    });
  });

  group('LoginScreen — error state', () {
    testWidgets('falls back to choose-method UI (error surfaced via toast)',
        (tester) async {
      await tester.pumpWidget(
        _wrap(state: const LoginFormState.error('Something went wrong')),
      );
      // Error text is not rendered inline; the screen shows chooseMethod
      // while the toast dismisses above it.
      expect(find.textContaining('Something went wrong'), findsNothing);
      expect(find.text('Continue with Google'), findsOneWidget);
    });
  });
}
