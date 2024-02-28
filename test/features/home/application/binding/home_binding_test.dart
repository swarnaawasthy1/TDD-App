import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tddapp/core/network/network_layer.dart';
import 'package:tddapp/features/home/application/binding/home_binding.dart';
import 'package:tddapp/features/home/application/controller/home_controller.dart';
import 'package:tddapp/features/home/domain/i_home_repository.dart';
import 'package:tddapp/features/home/infrastructure/home_repository.dart';


void main() {
  group('HomeBinding dependencies', () {
    test('should register ApiBaseHelper dependency', () {
      final binding = HomeBinding();
      binding.dependencies();

      final apiBaseHelper = Get.find<ApiBaseHelper>();

      expect(apiBaseHelper, isNotNull);
    });

    test('should register IHomeRepository dependency', () {
      final binding = HomeBinding();
      binding.dependencies();

      final homeRepository = Get.find<IHomeRepository>();

      expect(homeRepository, isNotNull);
      expect(homeRepository, isA<HomeRepository>());
    });

    test('should register HomeController dependency', () {
      final binding = HomeBinding();
      binding.dependencies();

      final homeController = Get.find<HomeController>();

      expect(homeController, isNotNull);
    });

    test('should resolve HomeController with IHomeRepository dependency', () {
      final binding = HomeBinding();
      binding.dependencies();

      final homeController = Get.find<HomeController>();

      expect(homeController.iHomeRepository, isA<IHomeRepository>());
    });
  });
}
