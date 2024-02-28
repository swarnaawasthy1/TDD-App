import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:tddapp/features/login/domain/i_login_repository.dart';
import 'package:tddapp/features/login/domain/login_model.dart';
import '../../../core/network/custom_response.dart';
import '../../../core/network/network_layer.dart';

class LoginRepository implements ILoginRepository {
  final ApiBaseHelper apiBaseHelper;

  LoginRepository({
    required this.apiBaseHelper,
  });

  @override
  Future<Either<String, String>> loginPost(LoginModel data) async {
    try {
      CustomResponse response = await apiBaseHelper.request(
        url: "https://json-placeholder.mock.beeceptor.com/login",
        method: HTTPMETHOD.POST,
        data: jsonEncode(data.toJson()),
      );
      if (response.fullResponse.data["success"] == true) {
        return right(response.fullResponse.data["message"]);
      }
      return left(response.message);
    } catch (e) {
      return left("Something Went Wrong");
    }
  }
}
