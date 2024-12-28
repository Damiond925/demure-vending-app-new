import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/auth_service.dart';

void main() {
  group('Auth Service Test', () {
    final authService = AuthService();

    test('Login Success', () {
      final result = authService.login('max@example.com', 'password123');
      expect(result, true);
    });

    test('Login Failure - Wrong Password', () {
      final result = authService.login('max@example.com', 'wrongpassword');
      expect(result, false);
    });

    test('Register Success', () {
      final result = authService.register('newuser@example.com', 'password123');
      expect(result, true);
    });

    test('Register Failure - Duplicate Email', () {
      authService.register('max@example.com', 'password123');
      final result = authService.register('max@example.com', 'password123');
      expect(result, false);
    });
  });
}