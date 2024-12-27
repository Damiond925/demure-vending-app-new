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

  // Search and Sorting Variables
  String _searchQuery = '';
  String _sortOption = 'Name';

  @override
  void initState() {
    super.initState();

    // Example Data - Preloaded Inventory
    _inventoryService.addItem(InventoryItem(id: '1', name: 'Chips', quantity: 10, price: 1.50));
    _inventoryService.addItem(InventoryItem(id: '2', name: 'Soda', quantity: 8, price: 1.25));
    _inventoryService.addItem(InventoryItem(id: '3', name: 'Candy', quantity: 15, price: 0.99));
  }

  @override
  Widget build(BuildContext context) {
    // Get all items
    List<InventoryItem> inventory = _inventoryService.getItems();

    // Apply Search Filter
    final filteredItems = inventory.where((item) {
      return item.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    // Apply Sorting
    if (_sortOption == 'Name') {
      filteredItems.sort((a, b) => a.name.compareTo(b.name));
    } else if (_sortOption == 'Price') {
      filteredItems.sort((a, b) => a.price.compareTo(b.price));
    } else if (_sortOption == 'Quantity') {
      filteredItems.sort((a, b) => a.quantity.compareTo(b.quantity));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 10),

            // Sorting Dropdown
            DropdownButton<String>(
              value: _sortOption,
              items: const [
                DropdownMenuItem(value: 'Name', child: Text('Name')),
                DropdownMenuItem(value: 'Price', child: Text('Price')),
                DropdownMenuItem(value: 'Quantity', child: Text('Quantity')),
              ],
              onChanged: (value) {
                setState(() {
                  _sortOption = value!;
                });
              },
            ),
            const SizedBox(height: 10),

            // Inventory List
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Qty: ${item.quantity} | \$${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _inventoryService.deleteItem(item.id);
                        });
                      },
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