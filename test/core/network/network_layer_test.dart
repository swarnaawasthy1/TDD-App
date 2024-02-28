import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tddapp/core/network/connectivity_helper.dart';
import 'package:tddapp/core/network/network_layer.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late ApiBaseHelper apiBaseHelper;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiBaseHelper = ApiBaseHelper();
  });

  group('ApiBaseHelper', () {
    group('request', () {
      test('returns network error response when no internet connection',
          () async {
        when(ConnectivityHelper.checkInternetConnectivity())
            .thenAnswer((_) async => false);

        final response =
            await apiBaseHelper.request(url: 'https://example.com');

        expect(response.success, false);
        expect(response.message, 'network error');
        expect(response.data, null);
        expect(response.fullResponse, null);
      });

      test('returns successful response for a GET request', () async {
        when(ConnectivityHelper.checkInternetConnectivity())
            .thenAnswer((_) async => true);
        when(mockDio.get((argThat(
                    startsWith('https://json-placeholder.mock.beeceptor.com/')))
                as String))
            .thenAnswer((_) async => Response(data: {
                  "results": [
                    {"id": 1}
                  ]
                }, requestOptions: RequestOptions(path: '')));

        final response =
            await apiBaseHelper.request(url: 'https://example.com');

        expect(response.success, true);
        expect(response.message, '');
        expect(response.data, [
          {"id": 1}
        ]);
        expect(response.fullResponse, isNotNull);
      });

      test('returns successful response for a POST request', () async {
        when(ConnectivityHelper.checkInternetConnectivity())
            .thenAnswer((_) async => true);
        when(mockDio
                .post((argThat(startsWith('https://example.com'))) as String))
            .thenAnswer((_) async => Response(data: {
                  "results": [
                    {"id": 1}
                  ]
                }, requestOptions: RequestOptions(path: '')));

        final response = await apiBaseHelper.request(
            url: 'https://example.com', method: HTTPMETHOD.POST);

        expect(response.success, true);
        expect(response.message, '');
        expect(response.data, [
          {"id": 1}
        ]);
        expect(response.fullResponse, isNotNull);
      });
    });
  });
}
