import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/models/inventory_model.dart';
import 'package:demure_vending_app/services/inventory_service.dart';

void main() {
  group('Inventory Service Test', () {
    final inventoryService = InventoryService();

    test('Add Item - Adds Item to Inventory', () {
      final item = InventoryItem(id: '1', name: 'Soda', quantity: 10);
      inventoryService.addItem(item);
      final items = inventoryService.getItems();
      expect(items.contains(item), true);
    });

    test('Update Item - Updates Existing Item', () {
      final item = InventoryItem(id: '1', name: 'Soda', quantity: 10);
      inventoryService.addItem(item);

      final updatedItem = InventoryItem(id: '1', name: 'Soda', quantity: 5);
      inventoryService.updateItem('1', updatedItem);

      final items = inventoryService.getItems();
      expect(items.first.quantity, 5);
    });

    test('Delete Item - Removes Item from Inventory', () {
      final item = InventoryItem(id: '1', name: 'Soda', quantity: 10);
      inventoryService.addItem(item);
      inventoryService.deleteItem('1');

      final items = inventoryService.getItems();
      expect(items.isEmpty, true);
    });

    test('Get Items - Returns All Items', () {
      final item1 = InventoryItem(id: '1', name: 'Soda', quantity: 10);
      final item2 = InventoryItem(id: '2', name: 'Chips', quantity: 5);
      inventoryService.addItem(item1);
      inventoryService.addItem(item2);

      final items = inventoryService.getItems();
      expect(items.length, 2);
    });
  });
}