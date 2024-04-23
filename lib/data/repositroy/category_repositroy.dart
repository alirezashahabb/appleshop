import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/data/datasource/category_datasource.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<CategoryModel>>> getCategory();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDataSource _categoryDataSource = locator.get();
  @override
  Future<Either<String, List<CategoryModel>>> getCategory() async {
    try {
      var response = await _categoryDataSource.getcategory();
      return Right(response);
    } on ApiException catch (e) {
      return Left(e.message ?? 'خظایی رخ داده');
    }
  }
}
