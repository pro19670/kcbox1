// import 'package:household_inventory_app/domain/repositories/inventory_repository.dart';
// import 'package:household_inventory_app/domain/entities/item_entity.dart';
import '../domain/repositories/inventory_repository.dart';
import '../domain/entities/item_entity.dart';
import 'package:flutter/material.dart';
import '../models/item.dart';

class InventoryProvider extends ChangeNotifier implements InventoryRepository {
  final List<Item> _items = [];
  List<Item> get items => _items;

  @override
  Future<void> addItem(ItemEntity item) async {
    _items.add(Item(
      id: item.id,
      name: item.name,
      category: item.category,
      color: item.color,
      brand: item.brand,
      quantity: item.quantity,
    ));
    notifyListeners();
  }
@override
Future<void> deleteItem(int id) async {
  _items.removeWhere((item) => item.id == id);
  notifyListeners();
}

@override
Future<List<ItemEntity>> getItems() async {
  return _items.map((item) => ItemEntity(
    id: item.id,
    name: item.name,
    category: item.category,
    color: item.color,
    brand: item.brand,
    quantity: item.quantity,
  )).toList();
}
  void removeItem(int id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateItem(Item updatedItem) {
    final index = _items.indexWhere((item) => item.id == updatedItem.id);
    if (index != -1) {
      _items[index] = updatedItem;
      notifyListeners();
    }
  }

  void clearAll() {
    _items.clear();
    notifyListeners();
  }
}