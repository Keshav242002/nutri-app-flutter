import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// Sealed auth state for the Ahara app.
@freezed
sealed class AuthState with _$AuthState {
  /// No authenticated Firebase user.
  const factory AuthState.unauthenticated() = _Unauthenticated;

  /// Firebase user is signed in and backend user is loaded.
  const factory AuthState.authenticated(User user) = _Authenticated;

  /// Auth check in progress.
  const factory AuthState.loading() = _Loading;
}
