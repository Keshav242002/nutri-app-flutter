import 'dart:typed_data';

import 'package:ahara/core/network/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeUser extends Fake implements User {
  _FakeUser(this._token);
  final String _token;

  @override
  Future<String?> getIdToken([bool forceRefresh = false]) async => _token;
}

class _FakeAuth extends Fake implements FirebaseAuth {
  _FakeAuth({User? user}) : _user = user;
  final User? _user;

  @override
  User? get currentUser => _user;
}

class _CapturingAdapter implements HttpClientAdapter {
  RequestOptions? captured;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    captured = options;
    return ResponseBody.fromString(
      '{}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('AuthInterceptor.onRequest', () {
    test('attaches Bearer token when user is signed in', () async {
      final adapter = _CapturingAdapter();
      final dio = Dio(BaseOptions(baseUrl: 'https://test.com'));
      dio.interceptors.add(
        AuthInterceptor(auth: _FakeAuth(user: _FakeUser('my-token'))),
      );
      dio.httpClientAdapter = adapter;

      await dio.get<dynamic>('/');

      expect(adapter.captured!.headers['Authorization'], 'Bearer my-token');
    });

    test('omits Authorization header when no user is signed in', () async {
      final adapter = _CapturingAdapter();
      final dio = Dio(BaseOptions(baseUrl: 'https://test.com'));
      dio.interceptors.add(AuthInterceptor(auth: _FakeAuth()));
      dio.httpClientAdapter = adapter;

      await dio.get<dynamic>('/');

      expect(adapter.captured!.headers.containsKey('Authorization'), isFalse);
    });

    test('is constructible without auth arg (uses FirebaseAuth.instance)', () {
      // Verifies the default-arg path compiles; does not call Firebase.
      expect(AuthInterceptor.new, returnsNormally);
    });
  });
}
