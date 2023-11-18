class Varaints {
  final String id;
  final String name;
  final String typeId;
  final String value;
  final int priceChange;

  Varaints(this.id, this.name, this.typeId, this.value, this.priceChange);

  factory Varaints.fromJson(Map<String, dynamic> jsonObject) {
    return Varaints(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['type_id'],
      jsonObject['value'],
      jsonObject['price_change'],
    );
  }
}
