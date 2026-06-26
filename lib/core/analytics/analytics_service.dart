import 'dart:developer' as dev;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Thin wrapper over [FirebaseAnalytics] for the two events this app logs:
///
/// - `screen_viewed_<route>` — fired on every navigation (see app_router).
/// - `api_call` — fired for every HTTP request (see AnalyticsInterceptor).
///
/// Firebase event names must be <=40 chars, start with a letter, and contain
/// only letters/digits/underscores; param string values are capped at 100
/// chars. Both are enforced here so callers can pass raw routes/endpoints.
class AnalyticsService {
  /// Creates an [AnalyticsService] over the given Firebase analytics handle.
  const AnalyticsService(this._analytics);

  final FirebaseAnalytics _analytics;

  /// Logs a screen view as `screen_viewed_<sanitized-route>`.
  Future<void> logScreenView(String route) async {
    final suffix = _sanitizeSegment(route);
    final name = _clampName('screen_viewed_$suffix');
    dev.log('screen_view → $route ($name)', name: 'ANALYTICS');
    await _safe(() => _analytics.logEvent(
          name: name,
          parameters: {'route': _clampValue(route)},
        ));
  }

  /// Logs a completed/failed API call: HTTP status code, the response
  /// envelope's `status` field, and its `message`.
  Future<void> logApiCall({
    required int? statusCode,
    required String? apiStatus,
    required String? message,
  }) async {
    await _safe(() => _analytics.logEvent(
          name: 'api_call',
          parameters: {
            'status_code': statusCode ?? -1,
            'api_status': _clampValue(apiStatus ?? 'unknown'),
            'message': _clampValue(message ?? ''),
          },
        ));
  }

  Future<void> _safe(Future<void> Function() fn) async {
    try {
      await fn();
    } on Object catch (e) {
      // Analytics must never break a user flow.
      dev.log('analytics log failed: $e', name: 'ANALYTICS');
    }
  }

  /// Turns `/home/recipe/paneer-tikka` into `home_recipe_paneer_tikka`,
  /// collapsing path params and non-alphanumerics into single underscores.
  String _sanitizeSegment(String route) {
    final cleaned = route
        .toLowerCase()
        .replaceAll(RegExp('[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'^_+|_+$'), '');
    return cleaned.isEmpty ? 'root' : cleaned;
  }

  String _clampName(String name) =>
      name.length <= 40 ? name : name.substring(0, 40);

  String _clampValue(String value) =>
      value.length <= 100 ? value : value.substring(0, 100);
}

/// Provides the app-wide [AnalyticsService].
final analyticsServiceProvider = Provider<AnalyticsService>(
  (ref) => AnalyticsService(FirebaseAnalytics.instance),
);
