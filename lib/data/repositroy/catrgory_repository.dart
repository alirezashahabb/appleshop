import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/catogery_dataSorce.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryRepositroy {
  Future<Either<String, List<CategoryItems>>> getCategories();
}

class CategoryProductsRepository implements ICategoryRepositroy {
  @override
  Future<Either<String, List<CategoryItems>>> getCategories() async {
    final IcategoryDataSorce dataSorce = locator.get();

    try {
      var responce = await dataSorce.getCategories();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }
}
