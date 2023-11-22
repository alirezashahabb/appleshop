class ProdcutsList {
  final String id;
  final String collectionId;
  final String thumnail;
  final String descreption;
  final int discountprice;
  final int price;
  final String popularity;
  final String name;
  final int quality;
  final String categoryId;
  int? realPrice;
  num? percent;

  ProdcutsList(
      this.id,
      this.collectionId,
      this.thumnail,
      this.descreption,
      this.discountprice,
      this.price,
      this.popularity,
      this.name,
      this.quality,
      this.categoryId) {
    /// this is calculator realPrice
    realPrice = price + discountprice;
    percent = ((price - realPrice!) / price) * 100;
  }

  factory ProdcutsList.fromJson(Map<String, dynamic> jsonMap) {
    return ProdcutsList(
      jsonMap['id'],
      jsonMap['collectionId'],
      'http://startflutter.ir/api/files/${jsonMap['collectionId']}/${jsonMap['id']}/${jsonMap['thumbnail']}',
      jsonMap['description'],
      jsonMap['discount_price'],
      jsonMap['price'],
      jsonMap['popularity'],
      jsonMap['name'],
      jsonMap['quantity'],
      jsonMap['category'],
    );
  }
}
