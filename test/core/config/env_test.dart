import 'package:ahara/core/config/flavors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Flavor', () {
    test('parses dev from string', () {
      expect(Flavor.fromString('dev'), Flavor.dev);
    });

    test('parses staging from string', () {
      expect(Flavor.fromString('staging'), Flavor.staging);
    });

    test('parses prod from string', () {
      expect(Flavor.fromString('prod'), Flavor.prod);
    });

    test('is case-insensitive', () {
      expect(Flavor.fromString('DEV'), Flavor.dev);
      expect(Flavor.fromString('Staging'), Flavor.staging);
      expect(Flavor.fromString('PROD'), Flavor.prod);
    });

    test('returns dev for null', () {
      expect(Flavor.fromString(null), Flavor.dev);
    });

    test('returns dev for unrecognized value', () {
      expect(Flavor.fromString('unknown'), Flavor.dev);
      expect(Flavor.fromString(''), Flavor.dev);
    });

    test('all enum values are covered', () {
      expect(Flavor.values, hasLength(3));
      expect(
        Flavor.values,
        containsAll([Flavor.dev, Flavor.staging, Flavor.prod]),
      );
    });
  });
}
