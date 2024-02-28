import 'package:flutter_test/flutter_test.dart';
import 'package:tddapp/core/config/app_routes.dart';

void main() {
  group('AppRoutes tests', () {
    test('Homepage route', () {
      expect(AppRoutes.homepage, '/homepage');
    });

    test('Login route', () {
      expect(AppRoutes.login, '/login');
    });
  });
}
