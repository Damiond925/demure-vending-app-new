import 'package:flutter_test/flutter_test.dart';
import '../models/inventory_model.dart';
import '../services/database_helper.dart';

void main() {
  final dbHelper = DatabaseHelper.instance;

  group('Database Tests', () {
    test('Insert Item', () async {
      final item = InventoryItem(
        id: '1',
        productName: 'Soda',
        description: 'Coca-Cola 500ml',
        price: 1.50,
        quantity: 10,
      );

      int result = await dbHelper.insertItem(item);
      expect(result, 1); // Should insert 1 row
    });

    test('Get All Items', () async {
      List<InventoryItem> items = await dbHelper.getAllItems();
      expect(items.length, greaterThan(0)); // Should have items
    });

    test('Update Item', () async {
      final updatedItem = InventoryItem(
        id: '1',
        productName: 'Diet Soda',
        description: 'Coca-Cola Zero 500ml',
        price: 1.75,
        quantity: 15,
      );

      int result = await dbHelper.updateItem(updatedItem);
      expect(result, 1); // Should update 1 row
    });

    test('Delete Item', () async {
      int result = await dbHelper.deleteItem('1');
      expect(result, 1); // Should delete 1 row
    });
  });
}