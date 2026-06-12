import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Attaches the Firebase ID token to every outgoing request.
///
/// On 401: force-refreshes the token and retries the request once.
class AuthInterceptor extends Interceptor {
  /// Creates an [AuthInterceptor].
  ///
  /// Pass [auth] in tests to avoid a live [FirebaseAuth.instance] lookup.
  AuthInterceptor({FirebaseAuth? auth}) : _explicitAuth = auth;

  final FirebaseAuth? _explicitAuth;

  // Resolved lazily so construction never touches FirebaseAuth.instance.
  FirebaseAuth get _auth => _explicitAuth ?? FirebaseAuth.instance;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _auth.currentUser?.getIdToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      try {
        final fresh = await _auth.currentUser?.getIdToken(true);
        if (fresh != null) {
          final opts = err.requestOptions
            ..headers['Authorization'] = 'Bearer $fresh';
          final retry = await Dio().fetch<dynamic>(opts);
          return handler.resolve(retry);
        }
      } on Object catch (_) {
        // Refresh failed — fall through to propagate original error.
      }
    }
    handler.next(err);
  }
}
