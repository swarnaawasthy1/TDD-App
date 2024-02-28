import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:tddapp/features/home/application/controller/home_controller.dart';
import 'package:tddapp/features/home/domain/i_home_repository.dart';
import 'package:tddapp/features/home/domain/posts_model.dart';
import 'package:tddapp/features/home/presentation/home_page.dart';



class MockIHomeRepository extends Mock implements IHomeRepository {
  @override
  Future<Either<String, List<PostsModel>>> fetchPostsData() async {
    return Right([
      PostsModel(id: 1, title: 'Test Title 1', body: 'Test Body 1'),
      PostsModel(id: 2, title: 'Test Title 2', body: 'Test Body 2'),
    ]);
  }
}

void main() {
  group('HomePage tests', () {

    testWidgets('Homepage UI elements test', (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(
        home: HomePage(),
      ));

      expect(find.text('Homepage'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Widget test for HomePage', (WidgetTester tester) async {

      final List<PostsModel> testData = [
        PostsModel(title: 'Title 1', body: 'Body 1'),
        PostsModel(title: 'Title 2', body: 'Body 2'),
      ];


      final controller = HomeController(MockIHomeRepository());
      controller.postsData = testData;


      await tester.pumpWidget(
        MaterialApp(
          home: GetBuilder<HomeController>(
            init: controller,
            builder: (controller) => HomePage(),
          ),
        ),
      );


      for (final post in testData) {
        expect(find.text(post.title!), findsOneWidget);
        expect(find.text(post.body!), findsOneWidget);
      }
    });
  });
}



