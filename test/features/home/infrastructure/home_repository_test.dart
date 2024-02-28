import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tddapp/core/network/custom_response.dart';
import 'package:tddapp/core/network/network_layer.dart';
import 'package:tddapp/features/home/domain/posts_model.dart';
import 'package:tddapp/features/home/infrastructure/home_repository.dart';


class MockApiBaseHelper extends Mock implements ApiBaseHelper {}

void main() {
  late HomeRepository homeRepository;
  late MockApiBaseHelper mockApiBaseHelper;

  setUp(() {
    mockApiBaseHelper = MockApiBaseHelper();
    homeRepository = HomeRepository(apiBaseHelper: mockApiBaseHelper);
  });

  group('fetchPostsData', () {
    test('returns a list of PostsModel when successful', () async {
      final responseData = [
        {
          "userId": 1,
          "id": 1,
          "title": "Introduction to Artificial Intelligence",
          "body": "Learn the basics of Artificial Intelligence and its applications in various industries."
        },
        {
          "userId": 2,
          "id": 2,
          "title": "Web Development with React",
          "body": "Build modern web applications using React.js and explore its powerful features."
        }
      ];
      final customResponse = CustomResponse(
        success: true,
        message: 'Success',
        data: responseData,
      );
      when(mockApiBaseHelper.request(url: 'https://json-placeholder.mock.beeceptor.com/posts', method: HTTPMETHOD.GET))
          .thenAnswer((_) => Future.value(customResponse));

      final result = await homeRepository.fetchPostsData();
      expect(result.isRight(), true);

      if (result.isRight()) {
        expect(result.fold((l) => null, (r) => r), isA<List<PostsModel>>());
      } else {
        expect(result.fold((l) => l, (r) => null), 'Error: Response data is null');
      }
    });

    test('returns an error message when an exception is thrown', () async {
      const exceptionMessage = 'Test exception';
      when(mockApiBaseHelper.request(url: 'https://json-placeholder.mock.beeceptor.com/posts', method: HTTPMETHOD.GET))
          .thenThrow(Exception(exceptionMessage));

      final result = await homeRepository.fetchPostsData();
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => null), 'Something Went Wrong');
    });


  });
}
