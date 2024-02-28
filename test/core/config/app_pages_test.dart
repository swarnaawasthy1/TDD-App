import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tddapp/core/config/app_pages.dart';
import 'package:tddapp/core/config/app_routes.dart';
import 'package:tddapp/features/home/application/binding/home_binding.dart';
import 'package:tddapp/features/home/presentation/home_page.dart';
import 'package:tddapp/features/login/application/binding/login_binding.dart';
import 'package:tddapp/features/login/presentation/login_page.dart';

void main() {
  setUp(() {
    Get.put(LoginBinding());
    Get.put(HomeBinding());
  });

  group('AppPages', () {
    group('all', () {
      test('returns the correct page for homepage route', () {
        final page = AppPages.all
            .firstWhere((page) => page.name == AppRoutes.homepage)
            .page;
        expect(page(), isA<HomePage>());
      });

      test('returns the correct page for login route', () {
        final page = AppPages.all
            .firstWhere((page) => page.name == AppRoutes.login)
            .page;
        expect(page(), isA<LoginPage>());
      });
    });
  });
}
