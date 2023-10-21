class CategoryItems {
  final String collectionId;
  final String id;
  final String images;
  final String title;
  final String color;
  final String icone;

  CategoryItems(this.collectionId, this.id, this.images, this.title, this.color,
      this.icone);

  factory CategoryItems.fromJson(Map<String, dynamic> jsonMap) {
    return CategoryItems(
      jsonMap['collectionId'],
      jsonMap['id'],
      'http://startflutter.ir/api/files/${jsonMap['collectionId']}/${jsonMap['id']}/${jsonMap['thumbnail']}',
      jsonMap['title'],
      jsonMap['color'],
      'http://startflutter.ir/api/files/${jsonMap['collectionId']}/${jsonMap['id']}/${jsonMap['icon']}',
    );
  }
}
