import 'package:flutter_test/flutter_test.dart';
import 'package:demure_vending_app/services/role_service.dart';

void main() {
  group('Role Service Test', () {
    final roleService = RoleService();

    test('Assign Role - Adds Role to User', () {
      roleService.assignRole('user1', 'admin');
      final roles = roleService.getRoles('user1');
      expect(roles.contains('admin'), true);
    });

    test('Remove Role - Removes Role from User', () {
      roleService.assignRole('user1', 'admin');
      roleService.removeRole('user1', 'admin');
      final roles = roleService.getRoles('user1');
      expect(roles.contains('admin'), false);
    });

    test('Get Roles - Returns Empty List if No Roles', () {
      final roles = roleService.getRoles('user2');
      expect(roles.isEmpty, true);
    });

    test('Assign Multiple Roles - Stores All Roles', () {
      roleService.assignRole('user1', 'admin');
      roleService.assignRole('user1', 'editor');
      final roles = roleService.getRoles('user1');
      expect(roles.length, 2);
      expect(roles.contains('admin'), true);
      expect(roles.contains('editor'), true);
    });
  });
}