import 'package:appleshop1/common/string_common.dart';

class ProductModel {
  final String categoryId;
  final String collectionId;
  final String description;
  final int discount_price;
  final String id;
  final String name;
  final int price;
  final String thumbnail;
  final String popularity;
  int? realPrice;
  num? present;

  ProductModel({
    required this.categoryId,
    required this.collectionId,
    required this.description,
    required this.discount_price,
    required this.id,
    required this.name,
    required this.price,
    required this.thumbnail,
    required this.popularity,
  }) {
    realPrice = price - discount_price;
    // calculator present for products
    present = ((price - realPrice!) / price) * 100;
  }

  factory ProductModel.fromJson(Map<String, dynamic> jsonMap) {
    return ProductModel(
      categoryId: jsonMap['category'],
      collectionId: jsonMap['collectionId'],
      description: jsonMap['description'],
      discount_price: jsonMap['discount_price'],
      id: jsonMap['id'],
      name: jsonMap['name'],
      price: jsonMap['price'],
      thumbnail:
          '${StringCommon.baseUrl}files/${jsonMap['collectionId']}/${jsonMap['id']}/${jsonMap['thumbnail']}',
      popularity: jsonMap['popularity'],
    );
  }
}
