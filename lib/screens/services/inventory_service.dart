import '../models/inventory_model.dart';

class InventoryService {
  final List<InventoryItem> _items = []; // Local storage for inventory data

  // Get all items
  List<InventoryItem> getItems() {
    return _items;
  }

  // Add a new item
  void addItem(InventoryItem item) {
    _items.add(item);
  }

  // Update an existing item
  void updateItem(String id, InventoryItem updatedItem) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index] = updatedItem;
    }
  }

  // Delete an item
  void deleteItem(String id) {
    _items.removeWhere((item) => item.id == id);
  }

  // Find item by ID
  InventoryItem? findItemById(String id) {
    return _items.firstWhere((item) => item.id == id, orElse: () => InventoryItem(id: '', name: '', quantity: 0, price: 0.0));
  }
}