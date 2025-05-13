import 'inventory_item.dart'; // InventoryItem 데이터 모델 파일 임포트

class InventoryManager {
  List<InventoryItem> items = []; // 물품 목록

  // 물품 추가
  void addItem(InventoryItem item) {
    items.add(item);
  }

  // 물품 삭제
  void removeItem(InventoryItem item) {
    items.remove(item);
  }

  // 물품 목록 반환
  List<InventoryItem> getItems() {
    return items;
  }
}
