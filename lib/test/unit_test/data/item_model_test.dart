import 'package:flutter_test/flutter_test.dart';
// import 'package:household_inventory_app/data/models/item.dart';
import 'package:kcbox1/models/item.dart'; // ✅ 수정된 경로

class Item {
  final int id;
  final String name;
  final String category;
  final String color;
  final String brand;
  final int quantity;

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.color,
    required this.brand,
    required this.quantity,
  });

  // ✅ JSON 직렬화
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'color': color,
    'brand': brand,
    'quantity': quantity,
  };

  // ✅ JSON 역직렬화
  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json['id'],
    name: json['name'],
    category: json['category'],
    color: json['color'],
    brand: json['brand'],
    quantity: json['quantity'],
  );
}
void main() {
  test('Item model serialization', () {
    final item = Item(id: 1, name: "계란", category: "식재료", color: "흰색", brand: "농협", quantity: 10);
    final json = item.toJson();
    final fromJson = Item.fromJson(json);

    expect(fromJson.name, equals(item.name));
    expect(fromJson.quantity, equals(item.quantity));
  });
}
