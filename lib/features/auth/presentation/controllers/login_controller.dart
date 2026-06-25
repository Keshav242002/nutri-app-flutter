import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:ahara/features/auth/domain/models/login_form_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ahara/features/auth/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

/// Manages the login screen state machine.
///
/// State transitions:
/// chooseMethod → emailPasswordEntry → emailPasswordSubmitting → success
/// chooseMethod → googleSigningIn → success
@riverpod
class LoginController extends _$LoginController {
  /// Initialises with the default [LoginFormState.chooseMethod] state.
  @override
  LoginFormState build() => const LoginFormState.chooseMethod();

  AuthRepository get _repo => ref.read(authRepositoryProvider);

  /// Switches to email + password entry mode (default email flow).
  void selectEmail() {
    state = const LoginFormState.emailPasswordEntry(
      email: '',
      password: '',
      isSignUpMode: false,
    );
  }

  /// Updates the email field within [LoginFormState.emailPasswordEntry].
  void updateEmailForPassword(String email) {
    state.maybeWhen(
      emailPasswordEntry: (_, password, isSignUpMode, errorMessage) {
        state = LoginFormState.emailPasswordEntry(
          email: email,
          password: password,
          isSignUpMode: isSignUpMode,
        );
      },
      orElse: () {},
    );
  }

  /// Updates the password field within [LoginFormState.emailPasswordEntry].
  void updatePasswordField(String password) {
    state.maybeWhen(
      emailPasswordEntry: (email, _, isSignUpMode, errorMessage) {
        state = LoginFormState.emailPasswordEntry(
          email: email,
          password: password,
          isSignUpMode: isSignUpMode,
        );
      },
      orElse: () {},
    );
  }

  /// Toggles between sign-in and sign-up mode.
  void toggleSignUpMode() {
    state.maybeWhen(
      emailPasswordEntry: (email, password, isSignUpMode, _) {
        state = LoginFormState.emailPasswordEntry(
          email: email,
          password: password,
          isSignUpMode: !isSignUpMode,
        );
      },
      orElse: () {},
    );
  }

  /// Submits email + password — signs in if returning user, signs up otherwise.
  Future<void> submitEmailPassword(String email, String password) async {
    final isSignUp = state.maybeWhen(
      emailPasswordEntry: (_, __, isSignUpMode, ___) => isSignUpMode,
      orElse: () => false,
    );
    state = LoginFormState.emailPasswordSubmitting(email: email);

    final result = isSignUp
        ? await _repo.signUpWithEmailAndPassword(email, password)
        : await _repo.signInWithEmailAndPassword(email, password);

    state = result.when<LoginFormState>(
      success: (User user) {
        ref.read(authControllerProvider.notifier).setAuthenticated(user);
        return LoginFormState.success(user);
      },
      failure: (AppException e) => LoginFormState.emailPasswordEntry(
        email: email,
        password: password,
        isSignUpMode: isSignUp,
        errorMessage: e.message,
      ),
    );
  }

  /// Returns to [LoginFormState.chooseMethod].
  void goBack() => state = const LoginFormState.chooseMethod();

  /// Clears the inline error on [LoginFormState.emailPasswordEntry].
  ///
  /// Called after the error has been surfaced via toast so the field
  /// no longer shows stale error text.
  void clearEmailPasswordError() {
    state.maybeWhen(
      emailPasswordEntry: (email, password, isSignUpMode, _) {
        state = LoginFormState.emailPasswordEntry(
          email: email,
          password: password,
          isSignUpMode: isSignUpMode,
        );
      },
      orElse: () {},
    );
  }

  /// Initiates Google sign-in.
  Future<void> signInWithGoogle() async {
    state = const LoginFormState.googleSigningIn();

    final result = await _repo.signInWithGoogle();

    state = result.when<LoginFormState>(
      success: (User user) {
        ref.read(authControllerProvider.notifier).setAuthenticated(user);
        return LoginFormState.success(user);
      },
      failure: (AppException e) {
        // User cancelled Google sign-in — return silently to State A.
        if (e is UnauthorizedException && e.message.contains('cancelled')) {
          return const LoginFormState.chooseMethod();
        }
        return LoginFormState.error(e.message);
      },
    );
  }
}
