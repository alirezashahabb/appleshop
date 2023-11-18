import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/product_detail_dataSorce.dart';
import 'package:appleshop1/data/model/gallery.dart';
import 'package:appleshop1/data/model/product_varaint.dart';
import 'package:appleshop1/data/model/variant_type.dart';
import 'package:appleshop1/data/model/varint.dart';
import 'package:dartz/dartz.dart';

abstract class IProductDetailRepositroy {
  Future<Either<String, List<ProductGallery>>> getProducGallery();
  Future<Either<String, List<VariantType>>> getVaraintType();
  Future<Either<String, List<Varaints>>> getVaraints();
  Future<Either<String, List<ProdductVaraint>>> getprodctVaraint();
}

class ProdcutDetailRepository extends IProductDetailRepositroy {
  final IProductDetialDataSorce _dataSorce = locator.get();
  @override
  Future<Either<String, List<ProductGallery>>> getProducGallery() async {
    try {
      var responce = await _dataSorce.getGaller();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }

  ///this is for VaraintType
  @override
  Future<Either<String, List<VariantType>>> getVaraintType() async {
    try {
      var responce = await _dataSorce.varaintType();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }

  @override
  Future<Either<String, List<Varaints>>> getVaraints() async {
    try {
      var responce = await _dataSorce.varaintProducts();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }

  @override
  Future<Either<String, List<ProdductVaraint>>> getprodctVaraint() async {
    try {
      var responce = await _dataSorce.getproductVaraint();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }
}
