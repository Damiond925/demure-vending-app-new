import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/inventory_service.dart';
import 'package:demure_vending_app/models/inventory_model.dart';

void main() {
  late InventoryService inventoryService;

  setUp(() {
    inventoryService = InventoryService();
  });

  // Test Adding an Item
  test('Add an inventory item', () {
    final item = InventoryItem(id: '1', name: 'Soda', quantity: 10, price: 1.50);
    inventoryService.addItem(item);

    final items = inventoryService.getItems();
    expect(items.length, 1);
    expect(items.first.name, 'Soda');
  });

  // Test Updating an Item
  test('Update an inventory item', () {
    final item = InventoryItem(id: '1', name: 'Soda', quantity: 10, price: 1.50);
    inventoryService.addItem(item);

    final updatedItem = InventoryItem(id: '1', name: 'Water', quantity: 20, price: 2.00);
    inventoryService.updateItem('1', updatedItem);

    final items = inventoryService.getItems();
    expect(items.first.name, 'Water');
    expect(items.first.quantity, 20);
  });

  // Test Deleting an Item
  test('Delete an inventory item', () {
    final item = InventoryItem(id: '1', name: 'Soda', quantity: 10, price: 1.50);
    inventoryService.addItem(item);
    inventoryService.deleteItem('1');

    final items = inventoryService.getItems();
    expect(items.isEmpty, true);
  });
}