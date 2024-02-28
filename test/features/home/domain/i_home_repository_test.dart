/*
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tddapp/features/home/domain/i_home_repository.dart';
import 'package:tddapp/features/home/domain/posts_model.dart';
import 'package:dartz/dartz.dart';

void main() {
  group('IHomeRepository tests', () {
    late IHomeRepository homeRepository;

    setUp(() {
      homeRepository = MockHomeRepository();
    });

   */
/* test('fetchPostsData returns posts data or error', () async {
      final expectedPosts = [
        PostsModel(id: 1, title: 'Post 1', body: 'Body 1'),
        PostsModel(id: 2, title: 'Post 2', body: 'Body 2'),
      ];

      when(homeRepository.fetchPostsData())
          .thenAnswer((_) async => Right(expectedPosts));

      final result = await homeRepository.fetchPostsData();

      expect(result, isA<Right<String, List<PostsModel>>>());
      expect(result.getOrElse(() => []), expectedPosts);
    });

    test('fetchPostsData returns error message on failure', () async {
      const errorMessage = 'Failed to fetch posts';

      when(homeRepository.fetchPostsData())
          .thenAnswer((_) async => Left(errorMessage));

      final result = await homeRepository.fetchPostsData();

      expect(result, isA<Left<String, List<PostsModel>>>());
      expect(result.fold((l) => l, (r) => []), errorMessage);
    });*//*

  });
}


class MockHomeRepository extends Mock implements IHomeRepository {}
*/
