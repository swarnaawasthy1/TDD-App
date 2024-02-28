import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tddapp/core/network/custom_response.dart';
import 'package:tddapp/core/network/network_layer.dart';
import 'package:tddapp/features/login/domain/login_model.dart';
import 'package:tddapp/features/login/infrastructure/login_repository.dart';

class MockApiBaseHelper extends Mock implements ApiBaseHelper {}

void main() {
  late LoginRepository loginRepository;
  late MockApiBaseHelper mockApiBaseHelper;

  setUp(() {
    mockApiBaseHelper = MockApiBaseHelper();
    loginRepository = LoginRepository(apiBaseHelper: mockApiBaseHelper);
  });

  group('loginPost', ()
  {
    final loginModel = LoginModel(
        username: 'michael', password: 'success-password');

    test(
        'returns a Right containing the message when login is successful', () async {

      final loginModel = LoginModel(
          username: 'michael', password: 'success-password');
      final result = await loginRepository.loginPost(loginModel);
      expect(result.isRight(), true);

      expect(result.fold((l) => null, (r) => r), 'Login successful');
    });

    test(
        'returns a Left containing an error message when login is unsuccessful', () async {
      // Mock an unsuccessful login response
      final response = CustomResponse(
        success: false,
        message: 'Invalid username or password',
        data: {'success': false, 'error': 'Invalid username or password'},
      );

      // Stub the request method of mockApiBaseHelper
      when(mockApiBaseHelper.request(
        url: 'https://json-placeholder.mock.beeceptor.com/login',
        method: HTTPMETHOD.POST,
      ))
          .thenAnswer((_) async => response);

      // Call the loginPost method
      final result = await loginRepository.loginPost(loginModel);

      // Check if the result is a Left containing the expected error message
      expect(result.isLeft(), true);
      expect(
          result.fold((l) => l, (r) => null), 'Invalid username or password');
    });

    test('throws an exception when network error occurs', () async {
      // Stub the request method of mockApiBaseHelper to throw an exception
      when(mockApiBaseHelper.request(
          url: 'https://json-placeholder.mock.beeceptor.com/login',
          method: HTTPMETHOD.POST,
          data: loginModel.toJson()))
          .thenThrow(Exception('Network Error'));

      // Expect an exception to be thrown
      expect(() => loginRepository.loginPost(loginModel), throwsException);
    });

    test(
        'returns a Left containing the error message when response data is null', () async {
      // Stub the request method of mockApiBaseHelper to return a response with null data
      final response = CustomResponse(
        success: true,
        message: '',
        data: null,
      );
      when(mockApiBaseHelper.request(
        url: 'https://json-placeholder.mock.beeceptor.com/login',
        method: HTTPMETHOD.POST,
        data: anyNamed('data'),
      )).thenAnswer((_) async => response);

      // Call the loginPost method with a LoginModel object
      final result = await loginRepository.loginPost(
          LoginModel(username: 'testuser', password: 'testpassword'));

      // Check if the result is a Left and if the error message is "Something Went Wrong"
      expect(result.isLeft(), true);
      expect(result, 'Something Went Wrong');
    });
  });}