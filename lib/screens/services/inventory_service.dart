class InventoryItem {
  final String id;           // Unique ID for each item
  final String name;         // Item name
  final int quantity;        // Number of items available

  InventoryItem({
    required this.id,
    required this.name,
    required this.quantity,
  });

  // Convert Item to JSON for saving or transferring data
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
      };

  // Create an Item from JSON data
  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}
import 'dart:convert';

class InventoryService {
  // Temporary in-memory inventory data
  final List<InventoryItem> _inventory = [];

  // Add a new item to the inventory
  void addItem(InventoryItem item) {
    _inventory.add(item);
  }

  // Remove an item by ID
  void removeItem(String id) {
    _inventory.removeWhere((item) => item.id == id);
  }

  // Update the quantity of an item
  void updateQuantity(String id, int newQuantity) {
    final index = _inventory.indexWhere((item) => item.id == id);
    if (index != -1) {
      _inventory[index] = InventoryItem(
        id: id,
        name: _inventory[index].name,
        quantity: newQuantity,
      );
    }
  }

  // Retrieve the inventory list
  List<InventoryItem> getInventory() {
    return _inventory;
  }

  // Save inventory data (Mocked as JSON for now)
  String saveInventory() {
    return jsonEncode(_inventory.map((item) => item.toJson()).toList());
  }

  // Load inventory data (Mocked as JSON for now)
  void loadInventory(String jsonString) {
    final List<dynamic> data = jsonDecode(jsonString);
    _inventory.clear();
    for (var item in data) {
      _inventory.add(InventoryItem.fromJson(item));
    }
  }
}