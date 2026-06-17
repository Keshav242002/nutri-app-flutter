// F0 smoke test — ensures the app widget tree mounts without error.
import 'package:ahara/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AharaApp mounts without error', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: AharaApp()));
    await tester.pumpAndSettle();
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
