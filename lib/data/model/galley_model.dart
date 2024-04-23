import 'package:appleshop1/common/string_common.dart';

class GalleryModel {
  final String collectionId;
  final String id;
  final String product_id;
  final String image;

  GalleryModel({
    required this.collectionId,
    required this.id,
    required this.product_id,
    required this.image,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> jsonObject) {
    return GalleryModel(
      collectionId: jsonObject['collectionId'],
      id: jsonObject['id'],
      product_id: jsonObject['product_id'],
      image:
          '${StringCommon.baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
    );
  }
}
