import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/email_verification_service.dart';

void main() {
  group('Email Verification Service Test', () {
    final emailVerificationService = EmailVerificationService();

    test('Register New Email - Starts Unverified', () {
      emailVerificationService.registerEmail('test@example.com');
      final result = emailVerificationService.isEmailVerified('test@example.com');
      expect(result, false);
    });

    test('Verify Email - Success', () {
      emailVerificationService.registerEmail('test@example.com');
      emailVerificationService.verifyEmail('test@example.com');
      final result = emailVerificationService.isEmailVerified('test@example.com');
      expect(result, true);
    });

    test('Verify Email - Not Registered', () {
      final result = emailVerificationService.verifyEmail('unknown@example.com');
      expect(result, false);
    });

    test('Send Verification Email - Simulated Output', () {
      expect(
        () => emailVerificationService.sendVerificationEmail('test@example.com'),
        prints('Verification email sent to test@example.com\n'),
      );
    });
  });
}