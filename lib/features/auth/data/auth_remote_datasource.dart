import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/network/envelope.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';

/// Transport layer for auth — wraps [Dio] and Firebase Auth SDK.
///
/// Does not contain business logic. Throws [AppException] on failure.
class AuthRemoteDataSource {
  /// Creates an [AuthRemoteDataSource].
  AuthRemoteDataSource({
    required Dio dio,
    fb.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  }) : _dio = dio,
       _auth = firebaseAuth ?? fb.FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn();

  final Dio _dio;
  final fb.FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  // ---------- Backend calls ----------

  /// Calls `POST /api/v1/auth/register` — idempotent upsert.
  Future<User> register() async {
    final response = await _dio.post<Map<String, dynamic>>('/auth/register');
    return EnvelopeParser.parseSuccess(response.data!, User.fromJson);
  }

  /// Calls `GET /api/v1/auth/me`.
  Future<User> getMe() async {
    final response = await _dio.get<Map<String, dynamic>>('/auth/me');
    return EnvelopeParser.parseSuccess(response.data!, User.fromJson);
  }

  /// Calls `PATCH /api/v1/auth/me` to update display name.
  Future<User> updateDisplayName(String displayName) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/auth/me',
      data: {'display_name': displayName},
    );
    return EnvelopeParser.parseSuccess(response.data!, User.fromJson);
  }

  // ---------- Firebase Auth SDK calls ----------

  /// Returns the current Firebase ID token, force-refreshing if needed.
  Future<String?> getIdToken({bool forceRefresh = false}) =>
      _auth.currentUser?.getIdToken(forceRefresh) ?? Future.value();

  /// Google sign-in flow → Firebase credential.
  Future<fb.UserCredential> signInWithGoogle() async {
    final account = await _googleSignIn.signIn();
    if (account == null) {
      throw const UnauthorizedException(
        message: 'Google sign-in was cancelled.',
      );
    }
    final auth = await account.authentication;
    final credential = fb.GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );
    return _auth.signInWithCredential(credential);
  }

  /// Sends a Firebase Email Link to [email].
  Future<void> sendSignInLinkToEmail(String email, String continueUrl) async {
    final settings = fb.ActionCodeSettings(
      url: continueUrl,
      handleCodeInApp: true,
      iOSBundleId: 'com.ahara.ahara',
      androidPackageName: 'com.ahara.ahara',
      androidInstallApp: true,
      androidMinimumVersion: '21',
    );
    await _auth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: settings,
    );
  }

  /// Completes email-link sign-in from the intercepted deep link.
  Future<fb.UserCredential> signInWithEmailLink({
    required String email,
    required String emailLink,
  }) async {
    if (!_auth.isSignInWithEmailLink(emailLink)) {
      throw const UnauthorizedException(message: 'Invalid sign-in link.');
    }
    return _auth.signInWithEmailLink(email: email, emailLink: emailLink);
  }

  /// Signs out from Firebase and Google.
  Future<void> signOut() async {
    await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
  }

  /// The currently signed-in Firebase user, or `null`.
  fb.User? get currentFirebaseUser => _auth.currentUser;
}
