class PropertyModel {
  final String title;
  final String value;

  PropertyModel({
    required this.title,
    required this.value,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> jsonObject) {
    return PropertyModel(
      title: jsonObject['title'],
      value: jsonObject['value'],
    );
  }
}
