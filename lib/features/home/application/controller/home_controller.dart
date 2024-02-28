import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:tddapp/features/home/domain/posts_model.dart';

import '../../domain/i_home_repository.dart';

class HomeController extends GetxController{
  HomeController(this.iHomeRepository);
  final IHomeRepository iHomeRepository;

  List<PostsModel> postsData =[];
  bool isLoading = false;
  bool isError = false;
  String errorMsg= '';


  @override
  void onInit() {
    super.onInit();
    fetchPostsData();
  }

  fetchPostsData() async{
    isLoading = true;
    Either<String,List<PostsModel>> result = await iHomeRepository.fetchPostsData();
    result.fold((error){
      isError = true;
      errorMsg = error;
    },(r){
      isLoading = false;
      postsData = r ;
    });
    update();
  }
}

