import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/role_service.dart';

void main() {
  group('Role Service Test', () {
    final roleService = RoleService();

    test('Assign Role', () {
      roleService.assignRole('user1', 'admin');
      expect(roleService.getRole('user1'), 'admin');
    });

    test('Update Role', () {
      roleService.assignRole('user1', 'admin');
      roleService.assignRole('user1', 'editor');
      expect(roleService.getRole('user1'), 'editor');
    });

    test('Remove Role', () {
      roleService.assignRole('user1', 'admin');
      roleService.removeRole('user1');
      expect(roleService.getRole('user1'), null);
    });

    test('Nonexistent User Role', () {
      expect(roleService.getRole('user2'), null);
    });
  });
}