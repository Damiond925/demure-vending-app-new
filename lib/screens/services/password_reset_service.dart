class PasswordResetService {
  // Dummy database to store emails and passwords
  final Map<String, String> _users = {
    'user1@example.com': 'password123',
    'user2@example.com': 'password456',
  };

  // Function to check if the email exists
  bool emailExists(String email) {
    return _users.containsKey(email);
  }

  // Function to reset password
  bool resetPassword(String email, String newPassword) {
    if (_users.containsKey(email)) {
      _users[email] = newPassword;
      return true; // Password reset success
    }
    return false; // Email not found
  }
}