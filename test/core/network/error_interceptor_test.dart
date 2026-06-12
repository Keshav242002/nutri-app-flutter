import 'dart:convert';
import 'dart:typed_data';

import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/network/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter({this.statusCode, this.body, this.throwType});

  final int? statusCode;
  final Map<String, dynamic>? body;
  final DioExceptionType? throwType;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (throwType != null) {
      throw DioException(requestOptions: options, type: throwType!);
    }
    return ResponseBody.fromString(
      jsonEncode(body ?? {}),
      statusCode ?? 200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Dio _dio({
  int? statusCode,
  Map<String, dynamic>? body,
  DioExceptionType? throwType,
}) {
  final dio = Dio(BaseOptions(validateStatus: (s) => (s ?? 0) < 400));
  dio.interceptors.add(ErrorInterceptor());
  dio.httpClientAdapter = _FakeAdapter(
    statusCode: statusCode,
    body: body,
    throwType: throwType,
  );
  return dio;
}

Future<AppException> _catchException(Dio dio) async {
  try {
    await dio.get<dynamic>('/');
  } on DioException catch (e) {
    return e.error! as AppException;
  }
  throw StateError('Expected DioException');
}

void main() {
  group('ErrorInterceptor', () {
    test('connectionTimeout → TimeoutException', () async {
      final ex = await _catchException(
        _dio(throwType: DioExceptionType.connectionTimeout),
      );
      expect(ex, isA<TimeoutException>());
    });

    test('sendTimeout → TimeoutException', () async {
      final ex = await _catchException(
        _dio(throwType: DioExceptionType.sendTimeout),
      );
      expect(ex, isA<TimeoutException>());
    });

    test('receiveTimeout → TimeoutException', () async {
      final ex = await _catchException(
        _dio(throwType: DioExceptionType.receiveTimeout),
      );
      expect(ex, isA<TimeoutException>());
    });

    test('connectionError → NetworkException', () async {
      final ex = await _catchException(
        _dio(throwType: DioExceptionType.connectionError),
      );
      expect(ex, isA<NetworkException>());
    });

    test('401 NOT_AUTHENTICATED → UnauthorizedException', () async {
      final ex = await _catchException(
        _dio(
          statusCode: 401,
          body: {
            'status': 'error',
            'message': 'Unauthorized',
            'error': {'code': 'NOT_AUTHENTICATED'},
          },
        ),
      );
      expect(ex, isA<UnauthorizedException>());
    });

    test(
      '422 VALIDATION_ERROR → ValidationException with field errors',
      () async {
        final ex = await _catchException(
          _dio(
            statusCode: 422,
            body: {
              'status': 'error',
              'message': 'Validation failed',
              'error': {
                'code': 'VALIDATION_ERROR',
                'details': {
                  'email': ['Invalid email'],
                },
              },
            },
          ),
        );
        expect(ex, isA<ValidationException>());
        expect(
          (ex as ValidationException).fieldErrors,
          containsPair('email', ['Invalid email']),
        );
      },
    );

    test('500 → ServerException', () async {
      final ex = await _catchException(
        _dio(
          statusCode: 500,
          body: {'status': 'error', 'message': 'Server error'},
        ),
      );
      expect(ex, isA<ServerException>());
    });

    test('unknown DioExceptionType → UnknownException', () async {
      final ex = await _catchException(
        _dio(throwType: DioExceptionType.unknown),
      );
      expect(ex, isA<UnknownException>());
    });
  });
}
