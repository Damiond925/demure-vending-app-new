class RoleService {
  // Define roles
  static const String adminRole = 'admin';
  static const String userRole = 'user';

  // Dummy user roles for demonstration
  final Map<String, String> _userRoles = {
    'admin@example.com': adminRole,
    'user@example.com': userRole,
  };

  // Get role by email
  String getRole(String email) {
    return _userRoles[email] ?? userRole; // Default to 'user' role
  }

  // Check if user is admin
  bool isAdmin(String email) {
    return getRole(email) == adminRole;
  }

  // Check if user is a regular user
  bool isUser(String email) {
    return getRole(email) == userRole;
  }
}