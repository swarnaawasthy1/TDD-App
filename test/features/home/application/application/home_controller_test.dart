import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tddapp/features/home/application/controller/home_controller.dart';
import 'package:tddapp/features/home/domain/i_home_repository.dart';
import 'package:tddapp/features/home/domain/posts_model.dart';
import 'package:dartz/dartz.dart';

class MockIHomeRepository extends Mock implements IHomeRepository {
  @override
  Future<Either<String, List<PostsModel>>> fetchPostsData() {
    throw UnimplementedError();
  }
}
void main() {
  group('HomeController tests', () {
    late HomeController homeController;
    late MockIHomeRepository mockIHomeRepository;

    setUp(() {
      mockIHomeRepository = MockIHomeRepository();
      homeController = HomeController(mockIHomeRepository);
    });
    test('fetchPostsData does not update postsData on failure', () async {
      when(mockIHomeRepository.fetchPostsData())
          .thenAnswer((_) async => const Left('Failed to fetch posts'));

      await homeController.fetchPostsData();

      expect(homeController.postsData, isEmpty);
      expect(homeController.isError, true);
      expect(homeController.isLoading, false);
      expect(homeController.errorMsg, 'Error');

    });
    test('fetchPostsData updates postsData when successful', () async {
      // Arrange
      final testPosts = [
        PostsModel(id: 1, title: 'Post 1', body: 'Body 1'),
        PostsModel(id: 2, title: 'Post 2', body: 'Body 2'),
      ];
      when(mockIHomeRepository.fetchPostsData())
          .thenAnswer((_) async => Right(testPosts));

      await homeController.fetchPostsData();
      expect(homeController.isLoading, false);
      expect(homeController.isError, false);
      expect(homeController.postsData, testPosts);

    });

  });
}

