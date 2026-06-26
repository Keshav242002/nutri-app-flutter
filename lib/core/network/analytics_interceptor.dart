import 'package:ahara/core/analytics/analytics_service.dart';
import 'package:dio/dio.dart';

/// Logs every HTTP request to Firebase Analytics as an `api_call` event,
/// capturing the HTTP status code plus the response envelope's `status` and
/// `message` fields.
///
/// Runs alongside the ErrorInterceptor; it never mutates request/response —
/// it only observes. Full response bodies are intentionally NOT sent to
/// Analytics (param size limits + PII) — they are already logged to the
/// console via `dev.log` in each datasource.
class AnalyticsInterceptor extends Interceptor {
  /// Creates an [AnalyticsInterceptor] that reports to [_analytics].
  const AnalyticsInterceptor(this._analytics);

  final AnalyticsService _analytics;

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _analytics.logApiCall(
      statusCode: response.statusCode,
      apiStatus: _envelopeField(response.data, 'status'),
      message: _envelopeField(response.data, 'message'),
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _analytics.logApiCall(
      statusCode: err.response?.statusCode,
      apiStatus: _envelopeField(err.response?.data, 'status') ?? 'error',
      message: _envelopeField(err.response?.data, 'message') ?? err.message,
    );
    handler.next(err);
  }

  /// Safely reads a top-level string [key] from an envelope response body.
  String? _envelopeField(dynamic body, String key) {
    if (body is Map<String, dynamic>) {
      final value = body[key];
      if (value is String) return value;
    }
    return null;
  }
}
