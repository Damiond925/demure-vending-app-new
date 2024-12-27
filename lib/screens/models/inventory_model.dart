class InventoryItem {
  final String id;        // Unique identifier for the item
  final String name;      // Item name
  final int quantity;     // Quantity available
  final double price;     // Price of the item

  InventoryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  // Convert InventoryItem to a map for JSON storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }

  // Create InventoryItem from JSON
  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}