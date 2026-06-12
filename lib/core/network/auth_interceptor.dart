import 'package:dio/dio.dart';

/// Stub interceptor that will attach the Firebase ID token to outgoing
/// requests.
// TODO(F1): Implement token attachment and 401 refresh+retry logic.
// Per FLUTTER_SPEC.json#api_integration.interceptors:
// - Attach cached Firebase ID token as Bearer in Authorization header.
// - On 401: force-refresh token and retry the request once.
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO(F1): Attach Firebase ID token.
    // options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO(F1): On 401, refresh token and retry once.
    handler.next(err);
  }
}
