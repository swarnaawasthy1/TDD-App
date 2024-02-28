class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  String? link;
  int? commentCount;

  PostsModel(
      {this.userId,
      this.id,
      this.title,
      this.body,
      this.link,
      this.commentCount});

  PostsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    link = json['link'];
    commentCount = json['comment_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['link'] = this.link;
    data['comment_count'] = this.commentCount;
    return data;
  }
}
