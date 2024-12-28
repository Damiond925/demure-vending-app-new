import 'package:flutter/material.dart';

class AnalyticsService {
  // Tracks total items sold
  final Map<String, int> _salesData = {};

  // Add sales data
  void addSale(String productId, int quantity) {
    if (_salesData.containsKey(productId)) {
      _salesData[productId] = _salesData[productId]! + quantity;
    } else {
      _salesData[productId] = quantity;
    }
  }

  // Get sales data
  Map<String, int> getSalesData() {
    return _salesData;
  }

  // Get total items sold
  int getTotalSales() {
    return _salesData.values.fold(0, (a, b) => a + b);
  }

  // Clear all sales data
  void clearData() {
    _salesData.clear();
  }

  // Example: Print analytics summary
  void printAnalyticsSummary() {
    print('Sales Data: $_salesData');
    print('Total Items Sold: ${getTotalSales()}');
  }
}