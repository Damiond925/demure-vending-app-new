import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/password_reset_service.dart';

void main() {
  group('Password Reset Service Test', () {
    final passwordResetService = PasswordResetService();

    test('Request Password Reset - Generates Token', () {
      final token = passwordResetService.requestPasswordReset('test@example.com');
      expect(token.isNotEmpty, true);
    });

    test('Validate Token - Success', () {
      final token = passwordResetService.requestPasswordReset('test@example.com');
      final result = passwordResetService.validateResetToken('test@example.com', token);
      expect(result, true);
    });

    test('Validate Token - Invalid Token', () {
      passwordResetService.requestPasswordReset('test@example.com');
      final result = passwordResetService.validateResetToken('test@example.com', 'invalid_token');
      expect(result, false);
    });

    test('Validate Token - Expired Token', () {
      passwordResetService.requestPasswordReset('test@example.com');
      Future.delayed(Duration(seconds: 5), () {
        final result = passwordResetService.validateResetToken('test@example.com', 'expired_token');
        expect(result, false);
      });
    });
  });
}