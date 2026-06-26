import 'package:ahara/core/analytics/analytics_service.dart';
import 'package:ahara/core/config/env.dart';
import 'package:ahara/core/network/analytics_interceptor.dart';
import 'package:ahara/core/network/auth_interceptor.dart';
import 'package:ahara/core/network/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

/// Provides the configured [Dio] HTTP client.
///
/// Per FLUTTER_SPEC.json#api_integration.http_client:
/// - Single instance, exposed as [apiClientProvider].
/// - BaseOptions: connectTimeout=15s, receiveTimeout=30s.
/// - Base URL from [Env] config.
/// - Interceptors: AuthInterceptor, ErrorInterceptor, LogInterceptor.
@Riverpod(keepAlive: true)
Dio apiClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(),
    ErrorInterceptor(),
    AnalyticsInterceptor(ref.read(analyticsServiceProvider)),
    if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
  ]);

  return dio;
}
