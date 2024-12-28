import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:demure_vending_app/screens/product_details_screen.dart';

void main() {
  testWidgets('Product Details Screen displays correct details', (WidgetTester tester) async {
    // Create a test widget
    await tester.pumpWidget(MaterialApp(
      home: ProductDetailsScreen(
        productName: 'Soda',
        description: 'Chilled soda can',
        price: 1.50,
        quantity: 10,
      ),
    ));

    // Verify the product name
    expect(find.text('Soda'), findsOneWidget);

    // Verify the description
    expect(find.text('Chilled soda can'), findsOneWidget);

    // Verify the price
    expect(find.text('\$1.50'), findsOneWidget);

    // Verify the quantity
    expect(find.text('10 available'), findsOneWidget);
  });
}