class VariantModel {
  final String id;
  final String name;
  final String typeId;
  final String value;
  final int priceChange;

  VariantModel(
      {required this.id,
      required this.name,
      required this.typeId,
      required this.value,
      required this.priceChange});

  factory VariantModel.fromJson(Map<String, dynamic> jsonObject) {
    return VariantModel(
      id: jsonObject['id'],
      name: jsonObject['name'],
      typeId: jsonObject['type_id'],
      value: jsonObject['value'],
      priceChange: jsonObject['price_change'],
    );
  }
}
