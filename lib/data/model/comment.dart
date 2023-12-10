class CommentList {
  final String id;
  final String productId;
  final String text;
  final String userId;

  CommentList(this.id, this.productId, this.text, this.userId);

  factory CommentList.fromJson(Map<String, dynamic> jsonObject) {
    return CommentList(
      jsonObject['id'],
      jsonObject['product_id'],
      jsonObject['text'],
      jsonObject['user_id'],
    );
  }
}
