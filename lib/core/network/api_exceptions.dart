/// Sealed exception hierarchy for the Ahara app.
///
/// All API/network errors are mapped to a subtype of [AppException]
/// at the interceptor/datasource boundary.
///
/// Error flow: DioException → ErrorInterceptor → AppException → DataSource
/// → Repository wraps as Failure → Controller → Widget shows ErrorState.
sealed class AppException implements Exception {
  /// Creates an [AppException] with a human-readable [message].
  const AppException({required this.message});

  /// A human-readable description of the error.
  final String message;

  @override
  String toString() => 'AppException($message)';
}

/// The device has no network connectivity or the request could not
/// reach the server.
final class NetworkException extends AppException {
  /// Creates a [NetworkException].
  const NetworkException({
    super.message = 'No internet connection. Please check your network.',
  });
}

/// The request timed out (connect or receive).
final class TimeoutException extends AppException {
  /// Creates a [TimeoutException].
  const TimeoutException({
    super.message = 'Request timed out. Please try again.',
  });
}

/// The user is not authenticated (HTTP 401).
///
/// Triggers token refresh + retry in AuthInterceptor (F1).
/// If still failing, routes to re-auth.
final class UnauthorizedException extends AppException {
  /// Creates an [UnauthorizedException].
  const UnauthorizedException({
    super.message = 'Session expired. Please sign in again.',
  });
}

/// Backend validation failed (HTTP 400, error code VALIDATION_ERROR).
///
/// Carries per-field error messages for form display.
final class ValidationException extends AppException {
  /// Creates a [ValidationException] with field-level errors.
  const ValidationException({
    required this.fieldErrors,
    super.message = 'Please fix the errors below.',
  });

  /// Map of field name → list of error messages.
  ///
  /// Example: `{'email': ['This email is already registered.']}`
  final Map<String, List<String>> fieldErrors;

  @override
  String toString() =>
      'ValidationException: $message, fieldErrors: $fieldErrors';
}

/// The requested resource was not found (HTTP 404).
///
/// Maps to error codes like PROFILE_NOT_FOUND, MEAL_PLAN_NOT_FOUND.
final class NotFoundException extends AppException {
  /// Creates a [NotFoundException].
  const NotFoundException({
    super.message = 'The requested resource was not found.',
  });
}

/// Rate limit exceeded (HTTP 429).
///
/// Maps to error codes like REGENERATE_LIMIT, RATE_LIMITED.
final class RateLimitException extends AppException {
  /// Creates a [RateLimitException].
  const RateLimitException({
    super.message = 'Too many requests. Please wait a moment.',
  });
}

/// An internal server error (HTTP 5xx).
final class ServerException extends AppException {
  /// Creates a [ServerException].
  const ServerException({
    super.message = 'Something went wrong on our end. Please try again.',
  });
}

/// A catch-all for errors that do not map to any known subtype.
final class UnknownException extends AppException {
  /// Creates an [UnknownException].
  const UnknownException({
    super.message = 'An unexpected error occurred. Please try again.',
  });
}
