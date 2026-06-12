import 'package:ahara/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('AppButton', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(AppButton(label: 'Continue', onPressed: () {})),
      );
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('fires onPressed callback on tap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(AppButton(label: 'Tap me', onPressed: () => tapped = true)),
      );
      await tester.tap(find.byType(AppButton));
      expect(tapped, isTrue);
    });

    testWidgets('shows CircularProgressIndicator when isLoading', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(AppButton(label: 'Loading', onPressed: () {}, isLoading: true)),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('disables tap when isLoading is true', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          AppButton(
            label: 'Loading',
            onPressed: () => tapped = true,
            isLoading: true,
          ),
        ),
      );
      await tester.tap(find.byType(AppButton));
      expect(tapped, isFalse);
    });

    testWidgets('disabled when onPressed is null', (tester) async {
      await tester.pumpWidget(
        // Explicitly passing null to verify the disabled-state contract.
        // ignore: avoid_redundant_argument_values
        _wrap(const AppButton(label: 'Disabled', onPressed: null)),
      );
      final btn = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(btn.onPressed, isNull);
    });

    testWidgets('renders secondary variant without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          AppButton(
            label: 'Secondary',
            onPressed: () {},
            variant: AppButtonVariant.secondary,
          ),
        ),
      );
      expect(find.text('Secondary'), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          AppButton(
            label: 'With icon',
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ),
      );
      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}
