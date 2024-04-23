class VariantTypeModel {
  final String id;
  final String name;
  final String title;
  final VariantTypeEnum type;

  VariantTypeModel(
      {required this.id,
      required this.name,
      required this.title,
      required this.type});

  factory VariantTypeModel.fromJson(Map<String, dynamic> jsonObject) {
    return VariantTypeModel(
      id: jsonObject['id'],
      name: jsonObject['name'],
      title: jsonObject['title'],
      type: _getTypeEnum(jsonObject['type']),
    );
  }
}

VariantTypeEnum _getTypeEnum(String type) {
  switch (type) {
    case "Color":
      return VariantTypeEnum.Color;
    case "Voltage":
      return VariantTypeEnum.Voltage;
    case "Storage":
      return VariantTypeEnum.Storage;
    default:
      return VariantTypeEnum.Color;
  }
}

enum VariantTypeEnum { Color, Storage, Voltage }
