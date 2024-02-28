import 'package:flutter_test/flutter_test.dart';
import 'package:tddapp/core/network/custom_response.dart';

void main() {
  group('CustomResponse Test', () {
    test('Test CustomResponse instantiation with required parameters', () {
      final response = CustomResponse(
        success: true,
        message: 'Test message',
        data: {'key': 'value'},
      );

      expect(response.success, true);
      expect(response.message, 'Test message');
      expect(response.data, {'key': 'value'});
      expect(response.fullResponse, isNull);
    });

    test('Test CustomResponse instantiation with all parameters', () {
      final response = CustomResponse(
        success: false,
        message: 'Another message',
        data: [1, 2, 3],
        fullResponse: {'statusCode': 404},
      );

      expect(response.success, false);
      expect(response.message, 'Another message');
      expect(response.data, [1, 2, 3]);
      expect(response.fullResponse, {'statusCode': 404});
    });

    test('Test CustomResponse instantiation with required parameters only', () {

      expect(() => CustomResponse(success: true, message: 'Incomplete response'), throwsArgumentError);
    });
  });
}
