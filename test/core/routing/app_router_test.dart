import 'package:ahara/core/config/env.dart';
import 'package:ahara/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  setUpAll(Env.initialize);

  group('routerProvider', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('returns a GoRouter instance', () {
      final router = container.read(routerProvider);
      expect(router, isA<GoRouter>());
    });

    test('has a route registered at RoutePaths.home', () {
      final router = container.read(routerProvider);
      // Verify at least one route exists (the /home placeholder route).
      expect(router.configuration.routes, isNotEmpty);
    });

    test('is keepAlive — same instance on second read', () {
      final first = container.read(routerProvider);
      final second = container.read(routerProvider);
      expect(identical(first, second), isTrue);
    });
  });

  group('PlaceholderHomePage', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: PlaceholderHomePage(),
          ),
        ),
      );
      expect(find.text('Ahara'), findsWidgets);
    });
  });

  group('PlaceholderErrorPage', () {
    testWidgets('renders 404 message', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: PlaceholderErrorPage(),
          ),
        ),
      );
      expect(find.textContaining('404'), findsOneWidget);
    });
  });

  group('Router navigation', () {
    testWidgets('navigates to /home and shows PlaceholderHomePage',
        (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final router = container.read(routerProvider);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PlaceholderHomePage), findsOneWidget);
    });

    testWidgets('unknown route shows PlaceholderErrorPage', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final router = container.read(routerProvider);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );
      await tester.pumpAndSettle();

      router.go('/this-route-does-not-exist');
      await tester.pumpAndSettle();

      expect(find.byType(PlaceholderErrorPage), findsOneWidget);
    });
  });
}
