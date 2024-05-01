import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/data/datasource/category_product_datasource.dart';
import 'package:appleshop1/data/model/product_model.dart';
import 'package:appleshop1/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryProductRepository {
  Future<Either<String, List<ProductModel>>> getCategoryById(String categoryId);
}

class CategoryProductRepository extends ICategoryProductRepository {
  @override
  Future<Either<String, List<ProductModel>>> getCategoryById(
      String categoryId) async {
    final ICategoryProductDataSource categoryDataSource = locator.get();
    try {
      var response = await categoryDataSource.getCategoryById(categoryId);
      return Right(response);
    } on ApiException catch (e) {
      return Left(e.message ?? 'خظایی رخ داده');
    }
  }
}
