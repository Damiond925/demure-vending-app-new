import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/password_reset_service.dart';

void main() {
  late PasswordResetService passwordResetService;

  setUp(() {
    passwordResetService = PasswordResetService();
  });

  // Test Adding a Reset Token
  test('Add reset token for email', () {
    const email = 'test@example.com';
    passwordResetService.addResetToken(email);

    expect(passwordResetService.isValidResetToken(email, '123456'), true);
  });

  // Test Validating a Token
  test('Validate reset token', () {
    const email = 'test@example.com';
    passwordResetService.addResetToken(email);

    expect(passwordResetService.isValidResetToken(email, '123456'), true);
    expect(passwordResetService.isValidResetToken(email, '000000'), false);
  });

  // Test Resetting a Password
  test('Reset password with valid token', () {
    const email = 'test@example.com';
    passwordResetService.addResetToken(email);

    final success = passwordResetService.resetPassword(email, '123456', 'newPassword');
    expect(success, true);
  });

  test('Fail password reset with invalid token', () {
    const email = 'test@example.com';
    passwordResetService.addResetToken(email);

    final success = passwordResetService.resetPassword(email, '000000', 'newPassword');
    expect(success, false);
  });
}