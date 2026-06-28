import 'package:ahara/core/network/api_exceptions.dart';

/// Parses the standard API response envelope.
///
/// **VERIFY-against-Postman:** The shape below is built from
/// FLUTTER_SPEC.json#api_integration.response_envelope. The Postman
/// collection at `/Users/keshavrudo/nutriapp/nutri-app-backend/
/// POSTMAN_COLLECTION.json` is the tiebreaker if shapes differ.
///
/// Success envelope:
/// ```json
/// {
///   "status": "success",
///   "message": "...",
///   "data": { ... }
/// }
/// ```
///
/// Error envelope:
/// ```json
/// {
///   "status": "error",
///   "message": "Human-readable",
///   "error": {
///     "code": "MACHINE_CODE",
///     "details": { ... }
///   }
/// }
/// ```
class EnvelopeParser {
  const EnvelopeParser._();

  /// Unwraps a success envelope, returning the `data` field.
  ///
  /// Throws [ServerException] if the envelope shape is unexpected.
  /// Throws [AppException] subtype if the envelope indicates an error.
  static T parseSuccess<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> data) fromJson,
  ) {
    final status = json['status'] as String?;

    if (status == 'success') {
      final data = json['data'];
      if (data is Map<String, dynamic>) {
        return fromJson(data);
      }
      throw const ServerException(
        message: 'Unexpected response format: missing data field.',
      );
    }

    if (status == 'error') {
      throw _parseError(json);
    }

    throw const ServerException(
      message: 'Unexpected response format: unknown status.',
    );
  }

  /// Unwraps a success envelope where `data` is a list.
  static List<T> parseSuccessList<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> item) fromJson,
  ) {
    final status = json['status'] as String?;

    if (status == 'success') {
      final data = json['data'];
      if (data is List) {
        return data.cast<Map<String, dynamic>>().map(fromJson).toList();
      }
      throw const ServerException(
        message: 'Unexpected response format: data is not a list.',
      );
    }

    if (status == 'error') {
      throw _parseError(json);
    }

    throw const ServerException(
      message: 'Unexpected response format: unknown status.',
    );
  }

  /// Maps the error envelope to an [AppException] subtype.
  // TODO(F1): Complete the error code → exception mapping per
  // FLUTTER_SPEC.json#api_integration.error_code_to_ux_mapping.
  static AppException _parseError(Map<String, dynamic> json) {
    final errorObj = json['error'] as Map<String, dynamic>?;
    final message = json['message'] as String? ?? 'An error occurred.';
    final code = errorObj?['code'] as String?;

    // TODO(F1): Map all error codes from FLUTTER_SPEC.json
    // #api_integration.error_code_to_ux_mapping.
    return switch (code) {
      'NOT_AUTHENTICATED' => const UnauthorizedException(),
      'VALIDATION_ERROR' => ValidationException(
        message: message,
        fieldErrors: _parseFieldErrors(errorObj?['details']),
      ),
      'PROFILE_NOT_FOUND' ||
      'MEAL_PLAN_NOT_FOUND' => NotFoundException(message: message),
      'REGENERATE_LIMIT' ||
      'RATE_LIMITED' => RateLimitException(message: message),
      'INTERNAL_ERROR' || 'OPENAI_FAILURE' => ServerException(message: message),
      _ => UnknownException(message: message),
    };
  }

  static Map<String, List<String>> _parseFieldErrors(dynamic details) {
    if (details is! Map<String, dynamic>) {
      return const {};
    }
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
