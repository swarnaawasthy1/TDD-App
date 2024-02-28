import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tddapp/features/login/application/controller/login_controller.dart';
import 'package:tddapp/features/login/domain/i_login_repository.dart';
import 'package:tddapp/features/login/domain/login_model.dart';
import 'package:tddapp/features/login/presentation/login_page.dart';


void main() {
  group('Login Controller Test', () {
    late LoginController loginController;

    setUp(() {
      loginController = LoginController(MockLoginRepository());
    });

    test('Form Validation Test for empty fields', () {
      expect(loginController.isFormValid(), false);
    });

    test('Form validation test with filled fields', () {
      loginController.onUserNameChanged('username');
      loginController.onPasswordChanged('password');
      expect(loginController.isFormValid(), true);
    });
  });

  testWidgets('Login Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginPage(),
    ));

    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('Please sign in'), findsOneWidget);

  });
}
class MockLoginRepository extends ILoginRepository {
  @override
  Future<Either<String, String>> loginPost(LoginModel loginModel) async {
    return const Right('Success');
  }
}



