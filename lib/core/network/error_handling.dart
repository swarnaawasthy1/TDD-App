import 'package:dio/dio.dart';

class ErrorHandling {

  static dynamic responseError(DioError exception){
    // try{
      switch(exception.type){
        case DioErrorType.connectTimeout:
          return "Connection  Timeout Occur";
        case DioErrorType.sendTimeout:
          return "Connection  Timeout Occur";

        case DioErrorType.receiveTimeout:
          return "Connection  Timeout Occur";

        case DioErrorType.response:
          switch(exception.response?.statusCode){
            case 400:
              return "The request cannot be fulfilled due to bad syntax";

            case 401:
              return exception.response?.data;

            case 500:
              return exception.response?.data;

            default :
              if(exception.response != null){
                if(exception?.response?.statusMessage != null) {
                  return exception?.response?.statusMessage.toString();
                } else {
                  return exception.response?.toString();
                }
              }
              else {
                return exception?.toString();
              }

          }

        case DioErrorType.cancel:
          return "Request is cancelled";

        case DioErrorType.other:

          return "Oops something went wrong please try after sometime";

      }
    // }on Exception catch (error) {
    //
    //   return error.toString();
    // }
  }
}