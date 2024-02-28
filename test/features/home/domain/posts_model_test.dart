import 'package:flutter_test/flutter_test.dart';
import 'package:tddapp/features/home/domain/posts_model.dart';


void main() {
  group('PostsModel', () {
    late Map<String, dynamic> jsonData;

    setUp(() {
      jsonData = {
        'userId': 1,
        'id': 123,
        'title': 'Test Title',
        'body': 'Test Body',
        'link': 'https://example.com',
        'comment_count': 5,
      };
    });

    test('fromJson() should parse JSON correctly', () {
      final postsModel = PostsModel.fromJson(jsonData);
      expect(postsModel.userId, jsonData['userId']);
      expect(postsModel.id, jsonData['id']);
      expect(postsModel.title, jsonData['title']);
      expect(postsModel.body, jsonData['body']);
      expect(postsModel.link, jsonData['link']);
      expect(postsModel.commentCount, jsonData['comment_count']);
    });

    test('toJson() should convert object to JSON correctly', () {
      final postsModel = PostsModel(
        userId: jsonData['userId'],
        id: jsonData['id'],
        title: jsonData['title'],
        body: jsonData['body'],
        link: jsonData['link'],
        commentCount: jsonData['comment_count'],
      );

      final generatedJsonData = postsModel.toJson();
      expect(generatedJsonData['userId'], jsonData['userId']);
      expect(generatedJsonData['id'], jsonData['id']);
      expect(generatedJsonData['title'], jsonData['title']);
      expect(generatedJsonData['body'], jsonData['body']);
      expect(generatedJsonData['link'], jsonData['link']);
      expect(generatedJsonData['comment_count'], jsonData['comment_count']);
    });
  });
}
