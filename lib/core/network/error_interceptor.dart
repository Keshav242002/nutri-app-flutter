import 'package:ahara/core/network/api_exceptions.dart';
import 'package:dio/dio.dart';

/// Stub interceptor that will map [DioException] to [AppException] subtypes.
// TODO(F1): Implement full mapping using response status codes and
// the envelope's error.code field.
// Per CLAUDE.md §5 error flow: DioException → ErrorInterceptor → AppException
// → DataSource → Repository wraps as Failure → Controller → Widget ErrorState.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _mapException(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        type: err.type,
        response: err.response,
      ),
    );
  }

  AppException _mapException(DioException err) {
    // TODO(F1): Complete mapping using response body error codes.
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();

      case DioExceptionType.connectionError:
        return const NetworkException();

      case DioExceptionType.badResponse:
        return _mapStatusCode(err.response?.statusCode);

      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return const UnknownException();
    }
  }

  AppException _mapStatusCode(int? statusCode) {
    // TODO(F1): Parse response body for error.code and map to
    // specific exceptions (VALIDATION_ERROR → ValidationException, etc.)
    return switch (statusCode) {
      401 => const UnauthorizedException(),
      404 => const NotFoundException(),
      429 => const RateLimitException(),
      final int code when code >= 500 => const ServerException(),
      _ => const UnknownException(),
    };
  }
}
