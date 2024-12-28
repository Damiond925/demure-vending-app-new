import 'package:flutter/material.dart';
import '../services/inventory_service.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final InventoryService _inventoryService = InventoryService();

  @override
  void initState() {
    super.initState();

    // Example Data - Preloaded Inventory
    _inventoryService.addItem(InventoryItem(id: '1', name: 'Chips', quantity: 10));
    _inventoryService.addItem(InventoryItem(id: '2', name: 'Candy', quantity: 3));
    _inventoryService.addItem(InventoryItem(id: '3', name: 'Soda', quantity: 5));
  }

  @override
  Widget build(BuildContext context) {
    // Fetch all items and low-stock items
    final inventory = _inventoryService.getItems();
    final lowStockItems = _inventoryService.getLowStockItems(5); // Threshold = 5

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          if (lowStockItems.isNotEmpty) // Display alert if low-stock items exist
            Container(
              color: Colors.red[100],
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Low Stock Alerts!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  for (var item in lowStockItems)
                    Text('${item.name} - Only ${item.quantity} left!'),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: inventory.length,
              itemBuilder: (context, index) {
                final item = inventory[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Quantity: ${item.quantity}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}