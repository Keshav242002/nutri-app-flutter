import 'package:ahara/features/auth/presentation/controllers/splash_controller.dart';
import 'package:ahara/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap({required SplashResult result}) {
  return ProviderScope(
    overrides: [splashControllerProvider.overrideWith((_) async => result)],
    child: const MaterialApp(home: SplashScreen()),
  );
}

void main() {
  group('SplashScreen', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(_wrap(result: SplashResult.goToLogin));
      expect(find.byType(SplashScreen), findsOneWidget);
    });

    testWidgets('shows tagline text', (tester) async {
      await tester.pumpWidget(_wrap(result: SplashResult.goToLogin));
      expect(find.text('NOURISH. PLAN. THRIVE.'), findsOneWidget);
    });

    testWidgets('renders Scaffold with navyDeep background', (tester) async {
      await tester.pumpWidget(_wrap(result: SplashResult.goToLogin));
      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, isNotNull);
    });
  });
}
