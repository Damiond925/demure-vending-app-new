import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/role_service.dart';

void main() {
  late RoleService roleService;

  setUp(() {
    roleService = RoleService();
  });

  // Test Adding a New Role
  test('Add a new role', () {
    const role = 'Admin';
    roleService.addRole(role);

    expect(roleService.getRoles().contains(role), true);
  });

  // Test Removing a Role
  test('Remove an existing role', () {
    const role = 'Admin';
    roleService.addRole(role);
    roleService.removeRole(role);

    expect(roleService.getRoles().contains(role), false);
  });

  // Test Checking Role Existence
  test('Check if role exists', () {
    const role = 'Manager';
    roleService.addRole(role);

    expect(roleService.hasRole(role), true);
  });

  // Test Non-Existent Role
  test('Check if non-existent role exists', () {
    const role = 'Unknown';

    expect(roleService.hasRole(role), false);
  });
}