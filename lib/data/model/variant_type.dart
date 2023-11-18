class VariantType {
  final String id;
  final String name;
  final String title;
  final String type;

  VariantType(this.id, this.name, this.title, this.type);

  factory VariantType.fromJson(Map<String, dynamic> jsonObject) {
    return VariantType(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['title'],
      jsonObject['type'],
    );
  }
}
