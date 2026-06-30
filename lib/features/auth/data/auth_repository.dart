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

  /// Signs in with email + password then registers with the backend.
  Future<Result<User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _ds.signInWithEmailAndPassword(email, password);
      return await _wrap(_ds.register);
    } on AppException catch (e) {
      return Failure(e);
    } on fb.FirebaseAuthException catch (e) {
      return Failure(_mapFirebaseError(e));
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }

  /// Creates a new account with email + password then registers with backend.
  Future<Result<User>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _ds.createUserWithEmailAndPassword(email, password);
      return await _wrap(_ds.register);
    } on AppException catch (e) {
      return Failure(e);
    } on fb.FirebaseAuthException catch (e) {
      return Failure(_mapFirebaseError(e));
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }

  /// Sends a password reset email via Firebase.
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    try {
      await _ds.sendPasswordResetEmail(email);
      return const Success(null);
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
        'email-already-in-use' => const ValidationException(
          fieldErrors: {
            'email': ['An account with this email already exists.'],
          },
        ),
        'weak-password' => const ValidationException(
          fieldErrors: {
            'password': ['Password must be at least 6 characters.'],
          },
        ),
        'wrong-password' || 'invalid-credential' =>
          const UnauthorizedException(message: 'Incorrect email or password.'),
        'user-not-found' => const UnauthorizedException(
          message:
              'No account found with that email. Tap "Create one" to sign up.',
        ),
        'operation-not-allowed' => const UnauthorizedException(
          message:
              'Email/password sign-in is not enabled. Please contact support.',
        ),
        'user-disabled' => const UnauthorizedException(
          message: 'This account has been disabled.',
        ),
        'too-many-requests' => const UnauthorizedException(
          message: 'Too many attempts. Please try again later.',
        ),
        _ => UnknownException(message: e.message ?? e.code),
      };
}
