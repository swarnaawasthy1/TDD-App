import 'package:get/get.dart';
import 'package:tddapp/features/home/application/binding/home_binding.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/login/application/binding/login_binding.dart';
import '../../features/login/presentation/login_page.dart';
import 'app_routes.dart';
class AppPages{
  static const initial = AppRoutes.login;
  static final all = [
    GetPage(
      name: AppRoutes.homepage,
      page: ()=> const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: ()=> const LoginPage(),
      binding: LoginBinding(),
    ),
  ];

}