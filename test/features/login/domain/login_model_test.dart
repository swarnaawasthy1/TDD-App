import 'package:flutter_test/flutter_test.dart';
import 'package:tddapp/features/login/domain/login_model.dart';
void main() {
  group('LoginModel tests', () {
    test('Test initialization from JSON', () {
      final Map<String, dynamic> jsonData = {
        'username': 'test_username',
        'password': 'test_password',
      };
      final loginModel = LoginModel.fromJson(jsonData);
      expect(loginModel.username, 'test_username');
      expect(loginModel.password, 'test_password');
    });

    test('Test conversion to JSON', () {
      final loginModel = LoginModel(username: 'test_username', password: 'test_password');
      final jsonData = loginModel.toJson();
      expect(jsonData['username'], 'test_username');
      expect(jsonData['password'], 'test_password');
    });
  });
}
