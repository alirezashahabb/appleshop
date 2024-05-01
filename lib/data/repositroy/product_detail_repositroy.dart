import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/data/datasource/product_deatil_data_sorce.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/galley_model.dart';
import 'package:appleshop1/data/model/product_varaint_model.dart';
import 'package:appleshop1/data/model/propert_model.dart';
import 'package:appleshop1/data/model/variant_type.dart';
import 'package:appleshop1/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class IProductDetailRepository {
  Future<Either<String, List<GalleryModel>>> getGallery(String productId);
  Future<Either<String, List<VariantTypeModel>>> getVariantType();
  Future<Either<String, List<ProductVariantModel>>> getProductVariant(
      String id);
  Future<Either<String, CategoryModel>> getProductCategory(String productId);
  Future<Either<String, List<PropertyModel>>> getProperty(String productId);
}

class ProductDetailRepository extends IProductDetailRepository {
  final IProductDataSource _dataSource = locator.get();

  /// this class  GalleryProduct DataSource
  @override
  Future<Either<String, List<GalleryModel>>> getGallery(
      String productId) async {
    try {
      var response = await _dataSource.getGallery(productId);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطایی رخ داده');
    }
  }

  /// this class VariantTye from DataSource
  @override
  Future<Either<String, List<VariantTypeModel>>> getVariantType() async {
    try {
      var response = await _dataSource.getVariantType();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطایی رخ داده');
    }
  }

  @override
  Future<Either<String, List<ProductVariantModel>>> getProductVariant(
      String id) async {
    try {
      var response = await _dataSource.getProductVariant(id);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطایی رخ داده');
    }
  }

  @override
  Future<Either<String, CategoryModel>> getProductCategory(
      String productId) async {
    try {
      var response = await _dataSource.getProductCategory(productId);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطایی رخ داده');
    }
  }

  @override
  Future<Either<String, List<PropertyModel>>> getProperty(
      String productId) async {
    try {
      var response = await _dataSource.getProperty(productId);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطایی رخ داده');
    }
  }
}
