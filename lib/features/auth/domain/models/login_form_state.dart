import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';

/// State machine for the login screen bottom sheet.
///
/// Adapted from the design's OTP flow to Firebase Email Link:
/// State C shows "check your email" + resend countdown instead of
/// 6 OTP boxes, because the backend has no custom OTP endpoints.
@freezed
sealed class LoginFormState with _$LoginFormState {
  /// Initial state — Google + Email buttons visible.
  const factory LoginFormState.chooseMethod() = _ChooseMethod;

  /// Email entry — user is typing their email address.
  const factory LoginFormState.emailEntry({
    required String email,
    required bool isValid,
    String? errorMessage,
  }) = _EmailEntry;

  /// Email link in flight — waiting for Firebase to send the link.
  const factory LoginFormState.emailLinkSending({required String email}) =
      _EmailLinkSending;

  /// Email link sent — showing "check your email" + resend countdown.
  const factory LoginFormState.emailLinkSent({
    required String email,
    required int resendCountdown,
  }) = _EmailLinkSent;

  /// Deep-link intercepted — completing sign-in with Firebase.
  const factory LoginFormState.emailLinkVerifying({required String email}) =
      _EmailLinkVerifying;

  /// Google sign-in in progress.
  const factory LoginFormState.googleSigningIn() = _GoogleSigningIn;

  /// Authentication succeeded.
  const factory LoginFormState.success(User user) = _Success;

  /// Terminal error — shown inline below the active action.
  const factory LoginFormState.error(String message) = _Error;
}
