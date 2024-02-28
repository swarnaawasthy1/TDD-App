import 'package:flutter_test/flutter_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mockito/mockito.dart';
import 'package:tddapp/core/network/connectivity_helper.dart';


// Mock class for Connectivity
class MockConnectivity extends Mock implements Connectivity {}

void main() {
  group('ConnectivityHelper Test', () {
    test('Test checkInternetConnectivity - Mobile', () async {
      var mockConnectivity = MockConnectivity();
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.mobile);

      var result = await ConnectivityHelper.checkInternetConnectivity();
      expect(result, true);
    });

    test('Test checkInternetConnectivity - WiFi', () async {
      var mockConnectivity = MockConnectivity();
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.wifi);

      var result = await ConnectivityHelper.checkInternetConnectivity();
      expect(result, true);
    });

    test('Test checkInternetConnectivity - None', () async {
      var mockConnectivity = MockConnectivity();
      when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.none);

      var result = await ConnectivityHelper.checkInternetConnectivity();
      expect(result, false);
    });
  });
}


