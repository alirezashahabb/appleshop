import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/data/datasource/home_data_sorce.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:appleshop1/data/model/product_model.dart';
import 'package:appleshop1/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepository {
  Future<Either<String, List<BannerModel>>> getBanner();
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<String, List<ProductModel>>> getBestSeller();
  Future<Either<String, List<ProductModel>>> getHottest();
}

class HomeRepository extends IHomeRepository {
  final IHomeDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<BannerModel>>> getBanner() async {
    try {
      var response = await _dataSource.getBanner();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطایی رخ داده');
    }
  }

  /// this is for product repository
  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      var response = await _dataSource.getProduct();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطایی رخ داده');
    }
  }

  /// this is for best Seller
  @override
  Future<Either<String, List<ProductModel>>> getBestSeller() async {
    try {
      var response = await _dataSource.getBestSeller();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطایی رخ داده');
    }
  }

  /// this is for Hottest
  @override
  Future<Either<String, List<ProductModel>>> getHottest() async {
    try {
      var response = await _dataSource.getHottest();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطایی رخ داده');
    }
  }
}
