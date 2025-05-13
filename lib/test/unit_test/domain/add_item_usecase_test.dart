import 'package:flutter_test/flutter_test.dart';
import 'package:kcbox1/domain/usecases/inventory/add_item_usecase.dart';
import 'package:kcbox1/domain/entities/item_entity.dart';
import 'package:kcbox1/domain/repositories/inventory_repository.dart'; // 🔺 인터페이스 import

// ✅ InventoryRepository 구현 추가
class FakeRepository implements InventoryRepository {
  final List<ItemEntity> items = [];

  @override
  Future<void> addItem(ItemEntity item) async {
    items.add(item);
  }
    // 필요 없는 메서드는 throw 처리해도 됩니다 (mock용)
  @override
  Future<void> deleteItem(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<ItemEntity>> getItems() {
    throw UnimplementedError();
  }
}

void main() {
  test('AddItemUseCase adds item to repository', () async {
    final repo = FakeRepository();
    final usecase = AddItemUseCase(repo);

    final item = ItemEntity(id: 1, name: "우유", category: "식재료", color: "흰색", brand: "서울우유", quantity: 1);
    await usecase.execute(item); // ✅ 함수처럼 쓰지 말고 메서드 호출

    expect(repo.items.contains(item), isTrue);
  });
}
