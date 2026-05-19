import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CookieCard renders its title', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CookieCard(
            title: Text('My Title'),
          ),
        ),
      ),
    );

    expect(find.text('My Title'), findsOneWidget);
    expect(find.byType(CookieCard), findsOneWidget);
  });
}
