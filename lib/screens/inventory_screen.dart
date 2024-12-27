import 'package:flutter/material.dart';
import '../services/inventory_service.dart';
import '../models/inventory_model.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final InventoryService _inventoryService = InventoryService();
  final TextEditingController _searchController = TextEditingController();
  List<InventoryItem> _filteredItems = [];

  @override
  void initState() {
    super.initState();

    // Example Preloaded Inventory
    _inventoryService.addItem(InventoryItem(id: '1', name: 'Chips', quantity: 5));
    _inventoryService.addItem(InventoryItem(id: '2', name: 'Soda', quantity: 2));
    _inventoryService.addItem(InventoryItem(id: '3', name: 'Candy', quantity: 10));

    _filteredItems = _inventoryService.getItems(); // Load initial items
  }

  // Search Function
  void _searchItems(String query) {
    setState(() {
      _filteredItems = _inventoryService
          .getItems()
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search Items',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _searchItems,
            ),
            const SizedBox(height: 16.0),

            // Inventory List
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  bool isLowStock = item.quantity < 5; // Low-stock alert
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Quantity: ${item.quantity}'),
                      trailing: isLowStock
                          ? const Icon(Icons.warning, color: Colors.red)
                          : const Icon(Icons.check_circle, color: Colors.green),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}