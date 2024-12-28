import 'package:flutter/material.dart';
import '../services/analytics_service.dart';

class AnalyticsDashboardScreen extends StatefulWidget {
  const AnalyticsDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsDashboardScreen> createState() => _AnalyticsDashboardScreenState();
}

class _AnalyticsDashboardScreenState extends State<AnalyticsDashboardScreen> {
  final AnalyticsService _analyticsService = AnalyticsService();

  @override
  void initState() {
    super.initState();

    // Example Data (Replace this with actual data)
    _analyticsService.addSale('Product A', 10);
    _analyticsService.addSale('Product B', 5);
    _analyticsService.addSale('Product C', 8);
  }

  @override
  Widget build(BuildContext context) {
    final salesData = _analyticsService.getSalesData();
    final totalSales = _analyticsService.getTotalSales();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Dashboard'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Analytics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: salesData.keys.length,
                itemBuilder: (context, index) {
                  String product = salesData.keys.elementAt(index);
                  int quantity = salesData[product]!;
                  return ListTile(
                    title: Text(product),
                    subtitle: Text('Quantity Sold: $quantity'),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Total Items Sold: $totalSales',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}