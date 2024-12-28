class AnalyticsService {
  // Track sales data
  void logSale(String productId, double amount) {
    print('Sale logged: Product $productId, Amount: \$$amount');
    // Add database logging later
  }

  // Track low stock alerts
  void logLowStock(String productId, int quantity) {
    if (quantity < 5) {
      print('Low Stock Alert: Product $productId has $quantity left!');
      // Add database logging later
    }
  }

  // Track user activity
  void logUserActivity(String userId, String activity) {
    print('User Activity: $userId -> $activity');
    // Add database logging later
  }

  // Generate summary report
  void generateReport() {
    print('Generating analytics report...');
    // Add database integration later
  }
}