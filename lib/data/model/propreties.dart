class Properties {
  final String value;
  final String title;

  Properties(this.value, this.title);

  factory Properties.fromJson(Map<String, dynamic> jsonObject) {
    return Properties(
      jsonObject['value'],
      jsonObject['title'],
    );
  }
}
