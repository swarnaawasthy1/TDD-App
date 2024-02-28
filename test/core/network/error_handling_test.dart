import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tddapp/core/network/error_handling.dart';

void main() {
  late DioError dioError;

  setUp(() {
    dioError = DioError(
      type: DioErrorType.response,
      response: Response(
        statusCode: 401,
        requestOptions: RequestOptions(path: ''),
      ), requestOptions: RequestOptions(path: ''),
    );
  });

  group('ErrorHandling', () {
    group('responseError', () {
      test('returns correct error message for connect timeout', () {
        dioError = DioError(
          type: DioErrorType.connectTimeout,
          requestOptions: RequestOptions(path: ''),
        );

        expect(ErrorHandling.responseError(dioError), 'Connection  Timeout Occur');
      });

      test('returns correct error message for send timeout', () {
        dioError = DioError(
          type: DioErrorType.sendTimeout,
          requestOptions: RequestOptions(path: ''),
        );

        expect(ErrorHandling.responseError(dioError), 'Connection  Timeout Occur');
      });

      test('returns correct error message for receive timeout', () {
        dioError = DioError(
          type: DioErrorType.receiveTimeout,
          requestOptions: RequestOptions(path: ''),
        );

        expect(ErrorHandling.responseError(dioError), 'Connection  Timeout Occur');
      });

      test('returns correct error message for response error', () {
        expect(ErrorHandling.responseError(dioError), 'Invalid credentials');
      });

      test('returns correct error message for response status code 400', () {
        dioError = DioError(
          type: DioErrorType.response,
          response: Response(
            statusCode: 400,

            requestOptions: RequestOptions(path: ''),
          ), requestOptions: RequestOptions(path: ''),
        );

        expect(ErrorHandling.responseError(dioError), 'The request cannot be fulfilled due to bad syntax');
      });

      test('returns correct error message for response status code 401', () {
        expect(ErrorHandling.responseError(dioError), 'Invalid credentials');
      });

      test('returns correct error message for response status code 500', () {
        dioError = DioError(
          type: DioErrorType.response,
          response: Response(
            statusCode: 500,

            requestOptions: RequestOptions(path: ''),
          ), requestOptions: RequestOptions(path: ''),
        );

        expect(ErrorHandling.responseError(dioError), 'Internal server error');
      });

      test('returns correct error message for response status code other than 400, 401, or 500', () {
        dioError = DioError(
          type: DioErrorType.response,
          response: Response(
            statusCode: 404,
            requestOptions: RequestOptions(path: ''),
          ), requestOptions: RequestOptions(path: ''),
        );

        expect(ErrorHandling.responseError(dioError), 'Not found');
      });

      test('returns correct error message for cancel error', ()
      {
        dioError = DioError(
          type: DioErrorType.cancel,
          requestOptions: RequestOptions(path: ''),
        );

        expect(ErrorHandling.responseError(dioError), 'Request is cancelled');
      });
  });});}