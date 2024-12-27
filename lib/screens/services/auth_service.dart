class AuthService {
  // Dummy user data for now (replace with database later)
  final Map<String, String> _users = {
    'user@example.com': 'password123'
  };

  // Login function
  bool login(String email, String password) {
    if (_users.containsKey(email) && _users[email] == password) {
      return true; // Login success
    }
    return false; // Login failed
  }

  // Registration function
  bool register(String email, String password) {
    if (_users.containsKey(email)) {
      return false; // User already exists
    }
    _users[email] = password;
    return true; // Registration success
  }
}