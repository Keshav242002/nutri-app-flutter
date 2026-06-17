import 'package:ahara/core/routing/app_router.dart';
import 'package:ahara/features/auth/domain/models/auth_state.dart';
import 'package:ahara/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// Bypasses FirebaseAuth in build() for router tests.
class _FakeAuthController extends AuthController {
  @override
  Future<AuthState> build() async => const AuthState.unauthenticated();
}

ProviderContainer _container() => ProviderContainer(
  overrides: [authControllerProvider.overrideWith(_FakeAuthController.new)],
);

void main() {
  group('appRouterProvider', () {
    late ProviderContainer container;

    setUp(() => container = _container());
    tearDown(() => container.dispose());

    test('returns a GoRouter instance', () {
      final router = container.read<GoRouter>(appRouterProvider);
      expect(router, isA<GoRouter>());
    });

    test('has registered routes', () {
      final router = container.read<GoRouter>(appRouterProvider);
      expect(router.configuration.routes, isNotEmpty);
    });

    test('is keepAlive — same instance on second read', () {
      final first = container.read<GoRouter>(appRouterProvider);
      final second = container.read<GoRouter>(appRouterProvider);
      expect(identical(first, second), isTrue);
    });
  });

  group('RouterErrorPage', () {
    testWidgets('renders 404 message', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RouterErrorPage()));
      expect(find.textContaining('404'), findsOneWidget);
    });
  });
}
