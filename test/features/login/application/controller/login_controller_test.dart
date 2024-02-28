import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:tddapp/features/home/application/controller/home_controller.dart';
import 'package:tddapp/features/home/domain/i_home_repository.dart';
import 'package:tddapp/features/login/application/controller/login_controller.dart';
import 'package:tddapp/features/login/domain/i_login_repository.dart';
import 'package:tddapp/features/login/domain/login_model.dart';


class MockLoginRepository extends Mock implements ILoginRepository {
  @override
  Future<Either<String, String>> loginPost(LoginModel data) {
    throw UnimplementedError();
  }
}

void main() {
  group('LoginController tests', () {
    late LoginController loginController;
    late MockLoginRepository mockRepository;

    setUp(() {
      mockRepository = MockLoginRepository();
      loginController = LoginController(mockRepository);
      loginController.onInit();
    });

    test('Initial values should be set correctly', () {
      expect(loginController.loginData, isNotNull);
      expect(loginController.userNameController, isNotNull);
      expect(loginController.passwordController, isNotNull);

    });

    test('postLogin method should update login data and call repository', () async {
      // Arrange
      const testUsername = 'testUsername';
      const testPassword = 'testPassword';
      when(mockRepository.loginPost(LoginModel())).thenAnswer((_) async => Right('Success'));

      // Act
      loginController.userNameController!.text = testUsername;
      loginController.passwordController!.text = testPassword;
      await loginController.postLogin();

      // Assert
      expect(loginController.loginData!.username, testUsername);
      expect(loginController.loginData!.password, testPassword);
      verify(mockRepository.loginPost(loginController.loginData!)).called(1);
      verify(Get.snackbar(
        "Success",
        "Login successful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF739072),
        colorText: Colors.white,
      )).called(1);
    });


    test('postLogin should handle login failure', () async {
      // Arrange
      const testUsername = 'testUsername';
      const testPassword = 'testPassword';
      when(mockRepository.loginPost(LoginModel())).thenAnswer((_) async => Left('Error'));

      // Act
      loginController.userNameController!.text = testUsername;
      loginController.passwordController!.text = testPassword;
      await loginController.postLogin();

      // Assert
      verify(mockRepository.loginPost(LoginModel())).called(1);
    });

    test('postLogin method should update login data and call repository', () async {
      // Arrange
      const testUsername = 'testUsername';
      const testPassword = 'testPassword';
      // when(mockRepository.loginPost(any)).thenAnswer((_) async => Right('Success'));

      // Act
      loginController.userNameController!.text = testUsername;
      loginController.passwordController!.text = testPassword;
      await loginController.postLogin();

      // Assert
      expect(loginController.loginData!.username, testUsername);
      expect(loginController.loginData!.password, testPassword);
      verify(mockRepository.loginPost(loginController.loginData!)).called(1);
      Get.lazyPut(()=>HomeController(Get.find<IHomeRepository>()));
    });

    test('onUserNameChanged method should trigger an update', () {
      // Act
      loginController.onUserNameChanged('newUsername');

      // Assert
      expect(loginController.userNameController!.text, 'newUsername');
    });

    test('onPasswordChanged method should trigger an update', () {
      // Act
      loginController.onPasswordChanged('newPassword');

      // Assert
      expect(loginController.passwordController!.text, 'newPassword');
    });

    test('isFormValid should return true when fields are not empty', () {
      // Arrange
      loginController.userNameController!.text = 'username';
      loginController.passwordController!.text = 'password';

      // Assert
      expect(loginController.isFormValid(), true);
    });

    test('isFormValid should return false when fields are empty', () {
      // Arrange
      loginController.userNameController!.text = '';
      loginController.passwordController!.text = '';

      // Assert
      expect(loginController.isFormValid(), false);
    });

    tearDown(() {
      loginController.onClose(); // Dispose controllers
    });
  });
}
