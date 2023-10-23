import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/products_datasorce.dart';
import 'package:appleshop1/data/model/producs_model.dart';
import 'package:dartz/dartz.dart';

abstract class IProductsRepository {
  Future<Either<String, List<ProdcutsList>>> getproducts();
}

class ProdcutsRepository implements IProductsRepository {
  @override
  Future<Either<String, List<ProdcutsList>>> getproducts() async {
    final IProductsDataSorce dataSorce = locator.get();
    try {
      var responce = await dataSorce.getProducts();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }
}
