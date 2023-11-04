import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/products_datasorce.dart';
import 'package:appleshop1/data/model/producs_model.dart';
import 'package:dartz/dartz.dart';

abstract class IProductsRepository {
  Future<Either<String, List<ProdcutsList>>> getproducts();
  Future<Either<String, List<ProdcutsList>>> getBestSellers();
  Future<Either<String, List<ProdcutsList>>> getHotest();
}

class ProdcutsRepository implements IProductsRepository {
  final IProductsDataSorce dataSorce = locator.get();
  @override
  Future<Either<String, List<ProdcutsList>>> getproducts() async {
    try {
      var responce = await dataSorce.getProducts();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }

  ///   /// get  BestSellers DataSorce
  @override
  Future<Either<String, List<ProdcutsList>>> getBestSellers() async {
    try {
      var responce = await dataSorce.getBsetSllers();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }

  /// get  hotest DataSorce
  @override
  Future<Either<String, List<ProdcutsList>>> getHotest() async {
    try {
      var responce = await dataSorce.getHotest();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }
}
