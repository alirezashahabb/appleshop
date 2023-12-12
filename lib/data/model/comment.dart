class CommentList {
  final String id;
  final String productId;
  final String text;
  final String userId;
  final String userThumbnailUrl;
  final String username;
  final String avatar;

  CommentList(this.id, this.productId, this.text, this.userId,
      this.userThumbnailUrl, this.username, this.avatar);

  factory CommentList.fromJson(Map<String, dynamic> jsonObject) {
    return CommentList(
      jsonObject['id'],
      jsonObject['product_id'],
      jsonObject['text'],
      jsonObject['user_id'],
      'http://startflutter.ir/api/files/${jsonObject['expand']['user_id']['collectionName']}/${jsonObject['expand']['user_id']['id']}/${jsonObject['expand']['user_id']['avatar']}',
      jsonObject['expand']['user_id']['name'],
      jsonObject['expand']['user_id']['avatar'],
    );
  }
}
