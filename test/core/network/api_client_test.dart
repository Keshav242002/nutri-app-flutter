import 'package:ahara/core/config/env.dart';
import 'package:ahara/core/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(Env.initialize);

  group('apiClientProvider', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('returns a Dio instance', () {
      final dio = container.read(apiClientProvider);
      expect(dio, isA<Dio>());
    });

    test('baseUrl matches Env.instance.apiBaseUrl', () {
      final dio = container.read(apiClientProvider);
      expect(dio.options.baseUrl, Env.instance.apiBaseUrl);
    });

    test('connectTimeout is 15 seconds', () {
      final dio = container.read(apiClientProvider);
      expect(
        dio.options.connectTimeout,
        const Duration(seconds: 15),
      );
    });

    test('receiveTimeout is 30 seconds', () {
      final dio = container.read(apiClientProvider);
      expect(
        dio.options.receiveTimeout,
        const Duration(seconds: 30),
      );
    });

    test('Content-Type header is application/json', () {
      final dio = container.read(apiClientProvider);
      expect(
        dio.options.headers['Content-Type'],
        'application/json',
      );
    });

    test('at least two interceptors are attached', () {
      final dio = container.read(apiClientProvider);
      // AuthInterceptor + ErrorInterceptor (LogInterceptor only in debug)
      expect(dio.interceptors.length, greaterThanOrEqualTo(2));
    });

    test('is keepAlive — same instance returned on second read', () {
      final first = container.read(apiClientProvider);
      final second = container.read(apiClientProvider);
      expect(identical(first, second), isTrue);
    });

    test('dev flavor resolves a non-empty base URL', () {
      expect(Env.instance.apiBaseUrl, isNotEmpty);
    });

    test('overrideWithValue replaces the instance', () {
      final fakeDio = Dio(BaseOptions(baseUrl: 'http://fake.test'));
      final overriddenContainer = ProviderContainer(
        overrides: [
          apiClientProvider.overrideWithValue(fakeDio),
        ],
      );
      addTearDown(overriddenContainer.dispose);

      final dio = overriddenContainer.read(apiClientProvider);
      expect(dio.options.baseUrl, 'http://fake.test');
    });
  });
}
