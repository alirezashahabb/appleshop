import 'package:appleshop1/data/model/producs_model.dart';
import 'package:dartz/dartz.dart';

import '../../common/Api_exptions.dart';
import '../../common/di.dart';
import '../datasource/category_product_datasorce.dart';

abstract class ICategoryProductsRepositoey {
  Future<Either<String, List<ProdcutsList>>> getCategoryById(String categoryId);
}

class CategoryProductRepository implements ICategoryProductsRepositoey {
  final ICategoryProductsDataSorce dataSorce = locator.get();
  @override
  Future<Either<String, List<ProdcutsList>>> getCategoryById(
      String categoryId) async {
    try {
      var responce = await dataSorce.getCategoryProducts(categoryId);
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }
}
