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
    _inventoryService.addItem(InventoryItem(id: '2', name: 'Soda', quantity: 20));
    _inventoryService.addItem(InventoryItem(id: '3', name: 'Candy', quantity: 15));
  }

  @override
  Widget build(BuildContext context) {
    final inventory = _inventoryService.getInventory();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: ListView.builder(
        itemCount: inventory.length,
        itemBuilder: (context, index) {
          final item = inventory[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Example function to increase quantity
                setState(() {
                  _inventoryService.updateQuantity(item.id, item.quantity + 1);
                });
              },
            ),
          );
        },
      ),
    );
  }
)
return Scaffold(
  appBar: AppBar(
    title: const Text('Inventory'),
  ),
  body: ListView.builder(
    itemCount: inventory.length,
    itemBuilder: (context, index) {
      final item = inventory[index];
      return ListTile(
        title: Text(item.productName),
        subtitle: Text('\$${item.price.toStringAsFixed(2)} - ${item.quantity} left'),
        onTap: () {
          // Navigate to Product Details Screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                productName: item.productName,
                description: item.description,
                price: item.price,
                quantity: item.quantity,
              ),
            ),
          );
        },
      );
    },
  ),
);
