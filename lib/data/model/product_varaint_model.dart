import 'package:appleshop1/data/model/varaint.dart';
import 'package:appleshop1/data/model/variant_type.dart';

class ProductVariantModel {
  final VariantTypeModel variantTypeModel;
  final List<VariantModel> variant;

  ProductVariantModel({
    required this.variantTypeModel,
    required this.variant,
  });
}
