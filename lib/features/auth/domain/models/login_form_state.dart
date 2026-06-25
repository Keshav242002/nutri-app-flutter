import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';

/// State machine for the login screen bottom sheet.
@freezed
sealed class LoginFormState with _$LoginFormState {
  /// Initial state — Google + Email buttons visible.
  const factory LoginFormState.chooseMethod() = _ChooseMethod;

  /// Email + password form — user is entering credentials.
  const factory LoginFormState.emailPasswordEntry({
    required String email,
    required String password,
    required bool isSignUpMode,
    String? errorMessage,
  }) = _EmailPasswordEntry;

  /// Email + password submit in flight.
  const factory LoginFormState.emailPasswordSubmitting({
    required String email,
  }) = _EmailPasswordSubmitting;

  /// Google sign-in in progress.
  const factory LoginFormState.googleSigningIn() = _GoogleSigningIn;

  /// Authentication succeeded.
  const factory LoginFormState.success(User user) = _Success;

  /// Terminal error — shown inline below the active action.
  const factory LoginFormState.error(String message) = _Error;
}
