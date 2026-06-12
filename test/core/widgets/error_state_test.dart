import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('ErrorState', () {
    testWidgets('displays error icon', (tester) async {
      await tester.pumpWidget(
        _wrap(const ErrorState(exception: NetworkException())),
      );
      expect(find.byIcon(Icons.error_outline_rounded), findsOneWidget);
    });

    testWidgets('NetworkException → no-internet message', (tester) async {
      await tester.pumpWidget(
        _wrap(const ErrorState(exception: NetworkException())),
      );
      expect(find.textContaining('No internet connection'), findsOneWidget);
    });

    testWidgets('TimeoutException → timed-out message', (tester) async {
      await tester.pumpWidget(
        _wrap(const ErrorState(exception: TimeoutException())),
      );
      expect(find.textContaining('timed out'), findsOneWidget);
    });

    testWidgets('UnauthorizedException → session-expired message', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(const ErrorState(exception: UnauthorizedException())),
      );
      expect(find.textContaining('Session expired'), findsOneWidget);
    });

    testWidgets('ServerException → something-went-wrong message', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(const ErrorState(exception: ServerException())),
      );
      expect(find.textContaining('Something went wrong'), findsOneWidget);
    });

    testWidgets('shows retry button when onRetry is provided', (tester) async {
      var retried = false;
      await tester.pumpWidget(
        _wrap(
          ErrorState(
            exception: const NetworkException(),
            onRetry: () => retried = true,
          ),
        ),
      );
      expect(find.byType(AppButton), findsOneWidget);
      await tester.tap(find.byType(AppButton));
      expect(retried, isTrue);
    });

    testWidgets('hides retry button when onRetry is null', (tester) async {
      await tester.pumpWidget(
        _wrap(const ErrorState(exception: NetworkException())),
      );
      expect(find.byType(AppButton), findsNothing);
    });
  });
}
