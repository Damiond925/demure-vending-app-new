import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/inventory_service.dart';
import 'package:demure_vending_app/models/inventory_model.dart';

void main() {
  group('Inventory Service Test', () {
    final inventoryService = InventoryService();

    test('Add Item', () {
      final item = InventoryItem(id: '1', name: 'Soda', quantity: 10);
      inventoryService.addItem(item);
      expect(inventoryService.getItems().length, 1);
    });

    test('Update Item', () {
      final item = InventoryItem(id: '1', name: 'Soda', quantity: 10);
      inventoryService.addItem(item);

      final updatedItem = InventoryItem(id: '1', name: 'Soda', quantity: 20);
      inventoryService.updateItem('1', updatedItem);

      final result = inventoryService.getItems().first;
      expect(result.quantity, 20);
    });

    test('Delete Item', () {
      final item = InventoryItem(id: '1', name: 'Soda', quantity: 10);
      inventoryService.addItem(item);

      inventoryService.deleteItem('1');
      expect(inventoryService.getItems().length, 0);
    });

    test('Item Not Found for Update', () {
      final updatedItem = InventoryItem(id: '2', name: 'Chips', quantity: 15);
      inventoryService.updateItem('2', updatedItem);

      expect(inventoryService.getItems().length, 0);
    });
  });
}