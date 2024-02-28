import 'package:dio/dio.dart';
import 'connectivity_helper.dart';
import 'custom_response.dart';
import 'error_handling.dart';

enum HTTPMETHOD { GET, POST }

class ApiBaseHelper {
  final Dio dio = Dio(BaseOptions(
    responseType: ResponseType.json,
  ));

  Future<CustomResponse> request({
    required String url,
    dynamic data,
    HTTPMETHOD method = HTTPMETHOD.GET,
    int? timeOut,
  }) async {
    Response? response;
    try {
      if (!await ConnectivityHelper.checkInternetConnectivity()) {
        return CustomResponse(
          message: 'network error',
          data: null,
          success: false,
          fullResponse: null,
        );
      }

      switch (method) {
        case HTTPMETHOD.GET:
          response = await dio.get(
            url,
          );
          break;
        case HTTPMETHOD.POST:
          response = await dio.post(
            url,
            data: data,
            options: timeOut == null
                ? Options()
                : Options(receiveTimeout: timeOut, sendTimeout: timeOut),
          );
          break;
      }

      final responseData =
          response?.data is Map ? response?.data["results"] : "";
      return CustomResponse(
        success: true,
        message: 'Success',
        data: responseData,
        fullResponse: response,
      );
    } on DioError catch (error) {
      return ErrorHandling.responseError(error);
    }
  }
}
