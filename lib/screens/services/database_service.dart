import 'package:flutter/material.dart';

class DatabaseService {
  // Simulated database storage
  final Map<String, dynamic> _data = {};

  // Add data to database
  void addItem(String key, dynamic value) {
    _data[key] = value;
    print('Added item: $key');
  }

  // Get data from database
  dynamic getItem(String key) {
    return _data[key];
  }

  // Update data in database
  void updateItem(String key, dynamic newValue) {
    if (_data.containsKey(key)) {
      _data[key] = newValue;
      print('Updated item: $key');
    } else {
      print('Item not found: $key');
    }
  }

  // Delete data from database
  void deleteItem(String key) {
    if (_data.containsKey(key)) {
      _data.remove(key);
      print('Deleted item: $key');
    } else {
      print('Item not found: $key');
    }
  }

  // List all data in database
  void listItems() {
    _data.forEach((key, value) {
      print('$key: $value');
    });
  }

  // Check if item exists
  bool itemExists(String key) {
    return _data.containsKey(key);
  }

  // Clear all data
  void clearDatabase() {
    _data.clear();
    print('Database cleared.');
  }
}