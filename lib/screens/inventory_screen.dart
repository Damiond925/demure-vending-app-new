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
  String _searchQuery = '';
  String _filterCategory = 'All';
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    // Example Data - Preloaded Inventory
    _inventoryService.addItem(InventoryItem(id: '1', name: 'Item A', category: 'Snacks', quantity: 10));
    _inventoryService.addItem(InventoryItem(id: '2', name: 'Item B', category: 'Drinks', quantity: 5));
    _inventoryService.addItem(InventoryItem(id: '3', name: 'Item C', category: 'Snacks', quantity: 20));
  }

  List<InventoryItem> _getFilteredAndSortedItems() {
    List<InventoryItem> items = _inventoryService.getItems();

    // Filter by category
    if (_filterCategory != 'All') {
      items = items.where((item) => item.category == _filterCategory).toList();
    }

    // Apply search query
    items = items.where((item) => item.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

    // Sort by name
    items.sort((a, b) => _sortAscending
        ? a.name.compareTo(b.name)
        : b.name.compareTo(a.name));

    return items;
  }

  @override
  Widget build(BuildContext context) {
    List<InventoryItem> inventory = _getFilteredAndSortedItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [
          // Search Bar
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: _InventorySearchDelegate(_inventoryService.getItems()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Dropdown
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _filterCategory,
              onChanged: (value) {
                setState(() {
                  _filterCategory = value!;
                });
              },
              items: ['All', 'Snacks', 'Drinks']
                  .map((category) => DropdownMenuItem(value: category, child: Text(category)))
                  .toList(),
            ),
          ),

          // Sort Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _sortAscending = !_sortAscending;
                });
              },
              child: Text(_sortAscending ? 'Sort Ascending' : 'Sort Descending'),
            ),
          ),

          // Inventory List
          Expanded(
            child: ListView.builder(
              itemCount: inventory.length,
              itemBuilder: (context, index) {
                final item = inventory[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Category: ${item.category}, Quantity: ${item.quantity}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _InventorySearchDelegate extends SearchDelegate {
  final List<InventoryItem> items;

  _InventorySearchDelegate(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = items.where((item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text('Category: ${item.category}, Quantity: ${item.quantity}'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}