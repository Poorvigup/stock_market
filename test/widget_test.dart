// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Correct the import to point to our project's main.dart file.
import 'package:auravest/main.dart';

void main() {
  testWidgets('HomeScreen builds and displays initial UI', (WidgetTester tester) async {
    // 2. Build our app and trigger a frame.
    // We must wrap our root widget in a ProviderScope because the app uses Riverpod.
    await tester.pumpWidget(const ProviderScope(
      child: AuraVestApp(),
    ));

    // 3. Verify that the initial screen (HomeScreen) is rendered correctly.
    
    // Verify our app's title is displayed in the AppBar.
    expect(find.text('AuraVest'), findsOneWidget);

    // Verify that the TextField for entering a stock symbol is present.
    expect(find.byType(TextField), findsOneWidget);

    // Verify that the "Search" button is present.
    expect(find.widgetWithText(ElevatedButton, 'Search'), findsOneWidget);
  });
}