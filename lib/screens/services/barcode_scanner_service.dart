import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerService {
  // Scan barcode and return result
  Future<String> scanBarcode() async {
    try {
      // Use scanner to get barcode value
      String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Scanner overlay color
        'Cancel', // Cancel button text
        true, // Show flash icon
        ScanMode.BARCODE, // Set scan mode
      );

      if (barcodeScanResult == '-1') {
        // Scan was canceled
        return 'Scan canceled';
      }

      return barcodeScanResult; // Return scanned value
    } catch (e) {
      // Handle errors
      return 'Failed to get barcode: $e';
    }
  }
}