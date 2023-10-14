/// this class handel Custom Exptions
class ApiExptions implements Exception {
  int? code;
  String? message;
  ApiExptions(this.code, this.message);
}
