import '../../entities/item_entity.dart';
import '../../repositories/inventory_repository.dart';

class AddItemUseCase {
  final InventoryRepository repository;

  AddItemUseCase(this.repository);

  Future<void> execute(ItemEntity item) {
    return repository.addItem(item);
  }
}
