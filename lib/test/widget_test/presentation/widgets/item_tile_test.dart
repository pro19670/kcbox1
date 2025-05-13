import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcbox1/presentation/widgets/list_items/item_tile.dart';

void main() {
  testWidgets('ItemTile displays item name', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ItemTile(name: '계란'))));
    expect(find.text('계란'), findsOneWidget);
  });
}
