import 'package:appleshop1/common/string_common.dart';

class BannerModel {
  final String categoryId;
  final String collectionId;
  final String id;
  final String thumbnail;

  BannerModel(
      {required this.categoryId,
      required this.collectionId,
      required this.id,
      required this.thumbnail});

  factory BannerModel.fromJson(Map<String, dynamic> jsonObject) {
    return BannerModel(
      categoryId: jsonObject['categoryId'],
      collectionId: jsonObject['collectionId'],
      id: jsonObject['id'],
      thumbnail:
          '${StringCommon.baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
