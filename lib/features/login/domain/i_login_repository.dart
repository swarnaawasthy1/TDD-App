import 'package:dartz/dartz.dart';
import 'login_model.dart';

abstract class ILoginRepository {
  Future<Either<String, String>> loginPost(LoginModel data);
}
