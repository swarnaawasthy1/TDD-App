/*
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tddapp/features/login/domain/i_login_repository.dart';
import 'package:tddapp/features/login/domain/login_model.dart';

class MockLoginRepository extends Mock implements ILoginRepository {}

void main() {
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
  });

  group('LoginRepository tests', () {
    test('Test successful login', () async {

      final loginModel = LoginModel(username: 'test_username', password: 'test_password');
      final expectedResponse = Right<String, String>('Login successful'); // Specify the types explicitly

      when(mockLoginRepository.loginPost(loginModel)).thenAnswer((_) async => Future.value(expectedResponse));
      final result = await mockLoginRepository.loginPost(loginModel);
      expect(result, expectedResponse);
    });

    test('Test failed login', () async {

      final loginModel = LoginModel(username: 'test_username', password: 'test_password');
      final expectedResponse = Left<String, String>('Login failed');
      when(mockLoginRepository.loginPost(loginModel)).thenAnswer((_) async => Future.value(expectedResponse));
      final result = await mockLoginRepository.loginPost(loginModel);
      expect(result, expectedResponse);
    });
  });
}*/
