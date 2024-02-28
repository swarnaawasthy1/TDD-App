
import 'package:tddapp/features/home/domain/posts_model.dart';
import 'package:dartz/dartz.dart';
import '../../../core/network/custom_response.dart';
import '../../../core/network/network_layer.dart';
import '../domain/i_home_repository.dart';

class HomeRepository implements IHomeRepository{
  final ApiBaseHelper apiBaseHelper;
  HomeRepository({
    required this.apiBaseHelper,
  });


  @override
  Future<Either<String, List<PostsModel>>> fetchPostsData() async{
    try{
      CustomResponse response = await apiBaseHelper.request(
        url: "https://json-placeholder.mock.beeceptor.com/posts",
        method: HTTPMETHOD.GET,
      );

      if(response.fullResponse.data != null){
        List<PostsModel> postsList = [];
        var result = response.fullResponse.data;
        result.forEach((element) {postsList.add(PostsModel.fromJson(element));});
        return right(postsList);
      }
      return left(response.message);
    } catch(e){
      return left("Something Went Wrong");}
  }
}
