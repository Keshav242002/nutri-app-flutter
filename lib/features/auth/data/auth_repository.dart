import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/auth/data/auth_remote_datasource.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

/// Business-logic boundary for authentication.
///
/// All methods return [Result<T>] — no raw exceptions escape this layer.
class AuthRepository {
  /// Creates an [AuthRepository].
  const AuthRepository({required AuthRemoteDataSource dataSource})
    : _ds = dataSource;

  final AuthRemoteDataSource _ds;

  /// Registers or upserts the current Firebase user with the backend.
  Future<Result<User>> register() => _wrap(_ds.register);

  /// Fetches the current backend user record.
  Future<Result<User>> getCurrentUser() => _wrap(_ds.getMe);

  /// Updates the user's display name on the backend.
  Future<Result<User>> updateDisplayName(String name) =>
      _wrap(() => _ds.updateDisplayName(name));

  /// Initiates Google sign-in and registers with the backend.
  Future<Result<User>> signInWithGoogle() async {
    try {
      await _ds.signInWithGoogle();
      return await _wrap(_ds.register);
    } on AppException catch (e) {
      return Failure(e);
    } on fb.FirebaseAuthException catch (e) {
      return Failure(_mapFirebaseError(e));
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }

  /// Sends a Firebase Email Link to [email].
  Future<Result<void>> sendEmailLink(String email, String continueUrl) async {
    try {
      await _ds.sendSignInLinkToEmail(email, continueUrl);
      return const Success(null);
    } on AppException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      final err = e.error;
      return Failure(
        err is AppException ? err : UnknownException(message: e.message ?? ''),
      );
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }

  /// Completes email-link sign-in then registers with the backend.
  Future<Result<User>> signInWithEmailLink({
    required String email,
    required String emailLink,
  }) async {
    try {
      await _ds.signInWithEmailLink(email: email, emailLink: emailLink);
      return await _wrap(_ds.register);
    } on AppException catch (e) {
      return Failure(e);
    } on fb.FirebaseAuthException catch (e) {
      return Failure(_mapFirebaseError(e));
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }

  /// Signs out from Firebase and clears session.
  Future<Result<void>> signOut() async {
    try {
      await _ds.signOut();
      return const Success(null);
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }

  // ---------- helpers ----------

  Future<Result<T>> _wrap<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } on AppException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      final err = e.error;
      return Failure(
        err is AppException ? err : UnknownException(message: e.message ?? ''),
      );
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }

  AppException _mapFirebaseError(fb.FirebaseAuthException e) =>
      switch (e.code) {
        'invalid-email' => const ValidationException(
          fieldErrors: {
            'email': ['Invalid email address.'],
          },
        ),
        'user-disabled' => const UnauthorizedException(
          message: 'This account has been disabled.',
        ),
        'invalid-action-code' => const UnauthorizedException(
          message: 'Sign-in link is invalid or has expired.',
        ),
        _ => UnknownException(message: e.message ?? e.code),
      };
}
