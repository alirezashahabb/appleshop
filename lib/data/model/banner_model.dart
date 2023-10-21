class BannerProducts {
  final String categoryId;
  final String collectionId;
  final String id;
  final String image;

  BannerProducts(this.categoryId, this.collectionId, this.id, this.image);

  factory BannerProducts.fromJson(Map<String, dynamic> jsonMap) {
    return BannerProducts(
      jsonMap['categoryId'],
      jsonMap['collectionId'],
      jsonMap['id'],
      'http://startflutter.ir/api/files/${jsonMap['collectionId']}/${jsonMap['id']}/${jsonMap['thumbnail']}',
    );
  }
}
