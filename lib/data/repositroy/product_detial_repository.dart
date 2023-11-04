import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/product_detail_dataSorce.dart';
import 'package:appleshop1/data/model/gallery.dart';
import 'package:dartz/dartz.dart';

abstract class IProductDetailRepositroy {
  Future<Either<String, List<ProductGallery>>> getProducGallery();
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
}
