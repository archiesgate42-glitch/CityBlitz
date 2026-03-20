// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:city_blitz_app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Wrap with ProviderScope because CityBlitzApp is a ConsumerWidget
    await tester.pumpWidget(
      const ProviderScope(
        child: CityBlitzApp(),
      ),
    );

    // Verify that the title is present (based on MaterialApp title or home screen content)
    // Looking at HomeScreen might be better, but let's just see if it pumps without error.
    expect(find.byType(CityBlitzApp), findsOneWidget);
  });
}
