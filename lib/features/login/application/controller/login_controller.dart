import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tddapp/features/login/domain/login_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/i_login_repository.dart';


 class LoginController extends GetxController{
   LoginController(this.iLoginRepository);
   final ILoginRepository iLoginRepository;
   LoginModel? loginData;
   TextEditingController? userNameController;
   TextEditingController? passwordController;


   @override
   void onInit() {
     loginData = LoginModel();
     userNameController = TextEditingController();
     passwordController = TextEditingController();
     super.onInit();
   }

   postLogin() async {
     loginData?.username = userNameController?.text;
     loginData?.password = passwordController?.text;
     Either<String, String> result = await iLoginRepository.loginPost(loginData!);
     result.fold((l) {}, (r) {
       Get.snackbar(
         "Message",
         "Login Successful",
         snackPosition: SnackPosition.BOTTOM,
         backgroundColor: const Color(0xFF739072),
         colorText: Colors.white,
       );
     });
     update();
   }

   void onUserNameChanged(String value) {
     userNameController?.text = value;
     update();
   }

   void onPasswordChanged(String value) {
     passwordController?.text = value;
     update();
   }

   bool isFormValid() {
     if (userNameController!.text.isNotEmpty &&
         passwordController!.text.isNotEmpty ) return true;
     return false;
   }

   @override
   void onClose() {
     userNameController?.dispose();
     passwordController?.dispose();
     super.onClose();
   }

 }

