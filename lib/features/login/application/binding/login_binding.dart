import 'package:get/get.dart';
import 'package:tddapp/core/network/network_layer.dart';
import 'package:tddapp/features/login/application/controller/login_controller.dart';
import 'package:tddapp/features/login/domain/i_login_repository.dart';
import 'package:tddapp/features/login/infrastructure/login_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiBaseHelper>(() => ApiBaseHelper());
    Get.lazyPut<ILoginRepository>(() =>
        LoginRepository(
            apiBaseHelper: Get.find<ApiBaseHelper>()));
    Get.lazyPut<LoginController>(() => LoginController(Get.find<ILoginRepository>()));

  }
}
