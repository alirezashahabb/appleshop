import 'package:appleshop1/common/string_common.dart';

class CategoryModel {
  final String collectionId;
  final String color;
  final String id;
  final String icon;
  final String thumbnail;
  final String title;

  CategoryModel(
      {required this.collectionId,
      required this.color,
      required this.id,
      required this.icon,
      required this.thumbnail,
      required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonObject) {
    return CategoryModel(
      collectionId: jsonObject['collectionId'],
      color: jsonObject['color'],
      id: jsonObject['id'],
      icon:
          '${StringCommon.baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['icon']}',
      thumbnail:
          '${StringCommon.baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      title: jsonObject['title'],
    );
  }
}
