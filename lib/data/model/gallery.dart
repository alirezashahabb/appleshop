class ProductGallery {
  final String imgeUrl;
  final String productId;

  ProductGallery(this.imgeUrl, this.productId);

  factory ProductGallery.fromJson(Map<String, dynamic> jsonMap) {
    return ProductGallery(
      'http://startflutter.ir/api/files/${jsonMap['collectionId']}/${jsonMap['id']}/${jsonMap['image']}',
      jsonMap['product_id'],
    );
  }
}
