// Smoke test: app boots to the splash screen without throwing.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deskapp_flutter/main.dart';

void main() {
  testWidgets('App boots to splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: DeskApp()));
    await tester.pump();
    expect(find.byType(DeskApp), findsOneWidget);
  });
}
