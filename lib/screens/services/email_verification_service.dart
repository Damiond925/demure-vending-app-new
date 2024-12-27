class EmailVerificationService {
  final Map<String, bool> _verifiedEmails = {}; // Tracks email verification status

  // Check if email is verified
  bool isEmailVerified(String email) {
    return _verifiedEmails[email] ?? false;
  }

  // Send a verification email
  void sendVerificationEmail(String email) {
    // Simulate email being sent
    print('Verification email sent to $email');
  }

  // Verify the email manually (simulating user clicking the link)
  void verifyEmail(String email) {
    if (_verifiedEmails.containsKey(email)) {
      _verifiedEmails[email] = true; // Mark email as verified
      print('$email has been verified!');
    } else {
      print('Email not found. Cannot verify.');
    }
  }

  // Register a new email (for testing verification status)
  void registerEmail(String email) {
    _verifiedEmails[email] = false; // Email starts unverified
  }
}