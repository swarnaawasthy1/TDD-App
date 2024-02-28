import 'package:get/get.dart';
import 'package:tddapp/core/network/network_layer.dart';
import 'package:tddapp/features/home/application/controller/home_controller.dart';
import 'package:tddapp/features/home/domain/i_home_repository.dart';
import 'package:tddapp/features/home/infrastructure/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiBaseHelper>(() => ApiBaseHelper());
    Get.lazyPut<IHomeRepository>(
        () => HomeRepository(apiBaseHelper: Get.find<ApiBaseHelper>()));
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<IHomeRepository>()));
  }
}
