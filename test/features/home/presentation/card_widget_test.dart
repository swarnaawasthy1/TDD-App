import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tddapp/features/home/domain/posts_model.dart';
import 'package:tddapp/features/home/presentation/card_widget.dart';


void main() {
  testWidgets('CardWidget displays correct data', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: CardWidget(
            postData: PostsModel(
              title: 'Test Title',
              body: 'Test Body',
            ),
          ),
        ),
      ),
    );


    final titleFinder = find.text('Test Title');
    final bodyFinder = find.text('Test Body');


    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
  });
}
