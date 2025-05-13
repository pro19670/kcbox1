// lib/domain/repositories/inventory_repository.dart

import '../entities/item_entity.dart'; // 상대 경로로 수정

abstract class InventoryRepository {
  Future<void> addItem(ItemEntity item);        
  Future<void> deleteItem(int id);              
  Future<List<ItemEntity>> getItems();          
}
