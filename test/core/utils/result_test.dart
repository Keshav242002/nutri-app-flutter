import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    group('Success', () {
      test('wraps data', () {
        const result = Success(42);
        expect(result.data, 42);
      });

      test('isSuccess is true', () {
        expect(const Success('hello').isSuccess, isTrue);
      });

      test('isFailure is false', () {
        expect(const Success('hello').isFailure, isFalse);
      });

      test('equality by data value', () {
        expect(const Success(1), equals(const Success(1)));
        expect(const Success(1), isNot(equals(const Success(2))));
      });

      test('toString contains value', () {
        expect(const Success(99).toString(), contains('99'));
      });
    });

    group('Failure', () {
      const exception = NetworkException();

      test('wraps exception', () {
        const result = Failure<int>(exception);
        expect(result.exception, exception);
      });

      test('isFailure is true', () {
        expect(const Failure<int>(exception).isFailure, isTrue);
      });

      test('isSuccess is false', () {
        expect(const Failure<int>(exception).isSuccess, isFalse);
      });

      test('equality by exception value', () {
        expect(
          const Failure<int>(NetworkException()),
          equals(const Failure<int>(NetworkException())),
        );
      });
    });

    group('map()', () {
      test('transforms Success data', () {
        const result = Success(5);
        final mapped = result.map((d) => d * 2);
        expect(mapped, equals(const Success(10)));
      });

      test('passes Failure through unchanged', () {
        const exception = TimeoutException();
        const result = Failure<int>(exception);
        final mapped = result.map((d) => d * 2);
        expect(mapped, equals(const Failure<int>(exception)));
      });
    });

    group('when()', () {
      test('calls success branch for Success', () {
        const result = Success('ok');
        final value = result.when(
          success: (d) => 'got: $d',
          failure: (_) => 'error',
        );
        expect(value, 'got: ok');
      });

      test('calls failure branch for Failure', () {
        const result = Failure<String>(ServerException());
        final value = result.when(
          success: (_) => 'ok',
          failure: (e) => 'error: ${e.runtimeType}',
        );
        expect(value, 'error: ServerException');
      });
    });
  });
}
