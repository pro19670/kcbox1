import '../../entities/item_entity.dart';
import '../../repositories/inventory_repository.dart';

class GetItemsUseCase {
  final InventoryRepository repository;

  GetItemsUseCase(this.repository);

  Future<List<ItemEntity>> call() async {
    return await repository.getItems();
  }
}
