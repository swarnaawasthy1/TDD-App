import 'package:flutter_test/flutter_test.dart';
import 'package:tddapp/core/network/network_layer.dart';
import 'package:tddapp/features/login/application/binding/login_binding.dart';
import 'package:tddapp/features/login/application/controller/login_controller.dart';
import 'package:tddapp/features/login/domain/i_login_repository.dart';
import 'package:get/get.dart';

void main() {
  group('LoginBinding tests', () {
    test('Dependencies are set correctly', () {
      final binding = LoginBinding();
      binding.dependencies();
      expect(Get.find<ApiBaseHelper>(), isNotNull); // Ensure ApiBaseHelper is registered
      expect(Get.find<ILoginRepository>(), isNotNull); // Ensure ILoginRepository is registered
      expect(Get.find<LoginController>(), isNotNull); // Ensure LoginController is registered
    });
  });
}
