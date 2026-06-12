import 'package:ahara/core/network/api_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppException subtypes', () {
    test('NetworkException has default message', () {
      const e = NetworkException();
      expect(e.message, isNotEmpty);
      expect(e, isA<AppException>());
    });

    test('TimeoutException has default message', () {
      const e = TimeoutException();
      expect(e.message, isNotEmpty);
      expect(e, isA<AppException>());
    });

    test('UnauthorizedException has default message', () {
      const e = UnauthorizedException();
      expect(e.message, isNotEmpty);
      expect(e, isA<AppException>());
    });

    test('NotFoundException has default message', () {
      const e = NotFoundException();
      expect(e.message, isNotEmpty);
      expect(e, isA<AppException>());
    });

    test('RateLimitException has default message', () {
      const e = RateLimitException();
      expect(e.message, isNotEmpty);
      expect(e, isA<AppException>());
    });

    test('ServerException has default message', () {
      const e = ServerException();
      expect(e.message, isNotEmpty);
      expect(e, isA<AppException>());
    });

    test('UnknownException has default message', () {
      const e = UnknownException();
      expect(e.message, isNotEmpty);
      expect(e, isA<AppException>());
    });

    test('AppException.toString includes message', () {
      const e = NetworkException();
      expect(e.toString(), contains(e.message));
    });

    group('ValidationException', () {
      test('carries fieldErrors map', () {
        const e = ValidationException(
          fieldErrors: {
            'email': ['Already in use.'],
          },
        );
        expect(e.fieldErrors['email'], contains('Already in use.'));
        expect(e, isA<AppException>());
      });

      test('multiple field errors', () {
        const e = ValidationException(
          fieldErrors: {
            'email': ['Invalid format.'],
            'password': ['Too short.', 'Must include a number.'],
          },
        );
        expect(e.fieldErrors.length, 2);
        expect(e.fieldErrors['password'], hasLength(2));
      });

      test('custom message overrides default', () {
        const e = ValidationException(
          fieldErrors: {},
          message: 'Custom error',
        );
        expect(e.message, 'Custom error');
      });

      test('toString includes fieldErrors', () {
        const e = ValidationException(
          fieldErrors: {'name': ['Required.']},
        );
        expect(e.toString(), contains('fieldErrors'));
      });
    });
  });
}
