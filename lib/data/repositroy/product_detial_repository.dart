import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/product_detail_dataSorce.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/gallery.dart';
import 'package:appleshop1/data/model/product_varaint.dart';
import 'package:appleshop1/data/model/propreties.dart';
import 'package:appleshop1/data/model/variant_type.dart';
import 'package:appleshop1/data/model/varint.dart';
import 'package:dartz/dartz.dart';

abstract class IProductDetailRepositroy {
  Future<Either<String, List<ProductGallery>>> getProducGallery(
      String productId);
  Future<Either<String, List<VariantType>>> getVaraintType();
  Future<Either<String, List<Varaints>>> getVaraints(String productId);
  Future<Either<String, List<ProdductVaraint>>> getprodctVaraint(
      String productId);
  Future<Either<String, CategoryItems>> getCatgories(String categoryId);
  Future<Either<String, List<Properties>>> getpropertis(String productId);
}

class ProdcutDetailRepository extends IProductDetailRepositroy {
  final IProductDetialDataSorce _dataSorce = locator.get();
  @override
  Future<Either<String, List<ProductGallery>>> getProducGallery(
      String productId) async {
    try {
      var responce = await _dataSorce.getGaller(productId);
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
  Future<Either<String, List<Varaints>>> getVaraints(String productId) async {
    try {
      var responce = await _dataSorce.varaintProducts(productId);
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }

  @override
  Future<Either<String, List<ProdductVaraint>>> getprodctVaraint(
      String productId) async {
    try {
      var responce = await _dataSorce.getproductVaraint(productId);
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }

  @override
  Future<Either<String, CategoryItems>> getCatgories(String categoryId) async {
    try {
      var responce = await _dataSorce.getCategories(categoryId);
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }

  @override
  Future<Either<String, List<Properties>>> getpropertis(
      String productId) async {
    try {
      var responce = await _dataSorce.getproperties(productId);
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }
}
