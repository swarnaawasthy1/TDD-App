import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tddapp/core/config/app_pages.dart';
import 'package:tddapp/core/config/app_routes.dart';
import 'features/login/application/binding/login_binding.dart';
import 'features/login/presentation/login_page.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TDD Application',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginPage(),
      getPages: AppPages.all,
      initialRoute: AppRoutes.login,
      initialBinding: LoginBinding(),
    );
  }
}



