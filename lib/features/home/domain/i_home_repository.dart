import 'package:tddapp/features/home/domain/posts_model.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepository {
  Future<Either<String, List<PostsModel>>> fetchPostsData();
}
