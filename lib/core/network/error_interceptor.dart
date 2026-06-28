import 'dart:developer' as dev;
import 'dart:io';

import 'package:ahara/core/network/api_exceptions.dart';
import 'package:dio/dio.dart';

/// Maps [DioException] to typed [AppException] subtypes.
///
/// Parses the response body `error.code` field per the envelope spec.
/// Error flow: DioException → ErrorInterceptor → AppException →
/// DataSource → Repository wraps as Failure → Controller → Widget.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _mapException(err);
    dev.log(
      '${err.requestOptions.method} ${err.requestOptions.path}'
      ' → ${exception.runtimeType}: ${exception.message}',
      name: 'API',
    );
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
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();

      case DioExceptionType.connectionError:
        final inner = err.error;
        if (inner is SocketException &&
            inner.message.contains('Connection refused')) {
          return const ServerException(
            message: 'Server is unreachable. Try again later.',
          );
        }
        return const NetworkException();

      case DioExceptionType.badResponse:
        return _mapResponse(err.response);

      case DioExceptionType.unknown:
        // A response was received but Dio could not turn it into the expected
        // JSON map — almost always the server replied with a non-JSON body
        // (e.g. a 5xx HTML error page), which surfaces here as a
        // FormatException rather than a badResponse. Treat it as a server
        // error so the user sees an accurate message instead of a vague
        // "unexpected error".
        if (err.error is FormatException || err.response != null) {
          return const ServerException();
        }
        return const UnknownException();

      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
        return const UnknownException();
    }
  }

  AppException _mapResponse(Response<dynamic>? response) {
    if (response == null) return const UnknownException();

    final body = response.data;
    if (body is Map<String, dynamic> && body['status'] == 'error') {
      return _parseErrorBody(body, response.statusCode);
    }
    return _mapStatusCode(response.statusCode);
  }

  AppException _parseErrorBody(Map<String, dynamic> body, int? statusCode) {
    final errorObj = body['error'] as Map<String, dynamic>?;
    final message = body['message'] as String? ?? 'An error occurred.';
    final code = errorObj?['code'] as String?;

    return switch (code) {
      'NOT_AUTHENTICATED' ||
      'TOKEN_EXPIRED' ||
      'TOKEN_REVOKED' => UnauthorizedException(message: message),
      'INVALID_TOKEN' => UnauthorizedException(message: message),
      'VALIDATION_ERROR' => ValidationException(
        message: message,
        fieldErrors: _parseFieldErrors(errorObj?['details']),
      ),
      'PROFILE_NOT_FOUND' ||
      'MEAL_PLAN_NOT_FOUND' => NotFoundException(message: message),
      'REGENERATE_LIMIT' ||
      'RATE_LIMITED' => RateLimitException(message: message),
      'INTERNAL_ERROR' || 'OPENAI_FAILURE' => ServerException(message: message),
      _ => _mapStatusCode(statusCode),
    };
  }

  AppException _mapStatusCode(int? statusCode) => switch (statusCode) {
    401 => const UnauthorizedException(),
    404 => const NotFoundException(),
    429 => const RateLimitException(),
    final int code when code >= 500 => const ServerException(),
    _ => const UnknownException(),
  };

  Map<String, List<String>> _parseFieldErrors(dynamic details) {
    if (details is! Map<String, dynamic>) return const {};
    // The Django backend wraps DRF field errors as: {"details": {"fields": {...}}}
    // so we unwrap the nested "fields" key if present.
    final fields = details['fields'] ?? details;
    if (fields is! Map<String, dynamic>) return const {};
    return fields.map(
      (key, value) => MapEntry(
        key,
        value is List ? value.cast<String>() : <String>[value.toString()],
      ),
    );
  }
}
