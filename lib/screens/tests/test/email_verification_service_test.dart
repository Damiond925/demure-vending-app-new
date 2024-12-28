import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/email_verification_service.dart';

void main() {
  late EmailVerificationService emailVerificationService;

  setUp(() {
    emailVerificationService = EmailVerificationService();
  });

  // Test Registering an Email
  test('Register a new email', () {
    const email = 'test@example.com';
    emailVerificationService.registerEmail(email);

    expect(emailVerificationService.isEmailVerified(email), false);
  });

  // Test Sending Verification Email
  test('Send a verification email', () {
    const email = 'test@example.com';
    emailVerificationService.sendVerificationEmail(email);

    // Simulate sending email (prints to console)
    expect(emailVerificationService.isEmailVerified(email), false);
  });

  // Test Verifying an Email
  test('Verify email', () {
    const email = 'test@example.com';
    emailVerificationService.verifyEmail(email);

    expect(emailVerificationService.isEmailVerified(email), true);
  });

  // Test Verifying Non-Existent Email
  test('Verify non-existent email', () {
    const email = 'fake@example.com';

    expect(() => emailVerificationService.verifyEmail(email), prints('Email not found. Cannot verify.\n'));
  });
}