import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcbox1/screens/home_screen.dart';

void main() {
  testWidgets('Home screen shows welcome text', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    expect(find.text('Welcome to Smart Inventory'), findsOneWidget);
  });
}
