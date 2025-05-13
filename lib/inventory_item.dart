class InventoryItem {
  String name; // 물품 이름
  String description; // 물품 설명
  String imageUrl; // 물품 이미지 URL
  int quantity; // 물품 수량

  InventoryItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
  });
}
