import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/auth_service.dart';

void main() {
  late AuthService authService;

  setUp(() {
    authService = AuthService();
  });

  // Test User Registration
  test('Register a new user', () {
    final result = authService.register('test@example.com', 'password123');
    expect(result, true);
  });

  test('Register an existing user', () {
    authService.register('test@example.com', 'password123');
    final result = authService.register('test@example.com', 'password123');
    expect(result, false); // Should fail since the user already exists
  });

  // Test User Login
  test('Login with correct credentials', () {
    authService.register('test@example.com', 'password123');
    final result = authService.login('test@example.com', 'password123');
    expect(result, true);
  });

  test('Login with incorrect password', () {
    authService.register('test@example.com', 'password123');
    final result = authService.login('test@example.com', 'wrongpassword');
    expect(result, false);
  });

  test('Login with non-existent user', () {
    final result = authService.login('nonexistent@example.com', 'password123');
    expect(result, false);
  });
}