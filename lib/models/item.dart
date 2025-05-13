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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        color: json['color'],
        brand: json['brand'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'color': color,
        'brand': brand,
        'quantity': quantity,
      };
}
