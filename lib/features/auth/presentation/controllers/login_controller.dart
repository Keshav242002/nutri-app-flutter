import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/validators.dart';
import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:ahara/features/auth/domain/models/login_form_state.dart';
import 'package:ahara/features/auth/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

/// Deep-link URL used for Firebase Email Link sign-in.
const _kEmailLinkContinueUrl = 'https://nutriplan.app/auth/callback';

/// Manages the login screen state machine.
///
/// State transitions:
/// chooseMethod → emailEntry → emailLinkSending → emailLinkSent
/// chooseMethod → googleSigningIn → success
@riverpod
class LoginController extends _$LoginController {
  /// Initialises with the default [LoginFormState.chooseMethod] state.
  @override
  LoginFormState build() => const LoginFormState.chooseMethod();

  AuthRepository get _repo => ref.read(authRepositoryProvider);

  /// Switches to email entry mode.
  void selectEmail() {
    state = const LoginFormState.emailEntry(email: '', isValid: false);
  }

  /// Updates the email field and validates format.
  void updateEmail(String email) {
    state = LoginFormState.emailEntry(
      email: email,
      isValid: Validators.isValidEmail(email),
    );
  }

  /// Returns to [LoginFormState.chooseMethod].
  void goBack() => state = const LoginFormState.chooseMethod();

  /// Sends a Firebase Email Link to the entered email address.
  Future<void> sendEmailLink(String email) async {
    state = LoginFormState.emailLinkSending(email: email);

    final result = await _repo.sendEmailLink(email, _kEmailLinkContinueUrl);

    state = result.when<LoginFormState>(
      success: (_) =>
          LoginFormState.emailLinkSent(email: email, resendCountdown: 45),
      failure: (AppException e) => LoginFormState.error(e.message),
    );
  }

  /// Ticks the resend countdown down by one second.
  void tickResendCountdown(String email, int current) {
    if (current <= 0) return;
    state = LoginFormState.emailLinkSent(
      email: email,
      resendCountdown: current - 1,
    );
  }

  /// Resends the email link and resets the countdown.
  Future<void> resendEmailLink(String email) => sendEmailLink(email);

  /// Completes sign-in from an intercepted deep link.
  Future<void> completeEmailLinkSignIn({
    required String email,
    required String emailLink,
  }) async {
    state = LoginFormState.emailLinkVerifying(email: email);

    final result = await _repo.signInWithEmailLink(
      email: email,
      emailLink: emailLink,
    );

    state = result.when<LoginFormState>(
      success: LoginFormState.success,
      failure: (AppException e) => LoginFormState.error(e.message),
    );
  }

  /// Initiates Google sign-in.
  Future<void> signInWithGoogle() async {
    state = const LoginFormState.googleSigningIn();

    final result = await _repo.signInWithGoogle();

    state = result.when<LoginFormState>(
      success: LoginFormState.success,
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
