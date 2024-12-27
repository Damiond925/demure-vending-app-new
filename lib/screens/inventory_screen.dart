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

  // Search-related variables
  List<InventoryItem> _filteredItems = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Example Data - Preloaded Inventory
    _inventoryService.addItem(InventoryItem(id: '1', name: 'Soda', quantity: 10));
    _inventoryService.addItem(InventoryItem(id: '2', name: 'Chips', quantity: 15));
    _inventoryService.addItem(InventoryItem(id: '3', name: 'Candy', quantity: 20));

    // Initialize filtered items
    _filteredItems = _inventoryService.getItems();

    // Add listener for search bar
    _searchController.addListener(() {
      _filterItems(_searchController.text);
    });
  }

  // Filter Items Function
  void _filterItems(String query) {
    final items = _inventoryService.getItems();
    if (query.isEmpty) {
      setState(() => _filteredItems = items);
    } else {
      setState(() {
        _filteredItems = items.where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        backgroundColor: Colors.black, // Adjusted for DEMURE theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Inventory List
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text('Quantity: ${item.quantity}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _inventoryService.deleteItem(item.id);
                            _filterItems(_searchController.text);
                          });
                        },
                      ),
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}