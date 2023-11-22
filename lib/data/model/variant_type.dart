class VariantType {
  final String id;
  final String name;
  final String title;
  final VariantTypeEnum type;

  VariantType(this.id, this.name, this.title, this.type);

  factory VariantType.fromJson(Map<String, dynamic> jsonObject) {
    return VariantType(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['title'],
      _getTypeEnum(jsonObject['type']),
    );
  }
}

VariantTypeEnum _getTypeEnum(String type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.COLOR;
    case 'Storage':
      return VariantTypeEnum.STORAGE;
    case 'Voltage':
      return VariantTypeEnum.VOLTAGE;
    default:
      return VariantTypeEnum.COLOR;
  }
}

enum VariantTypeEnum { COLOR, STORAGE, VOLTAGE }
