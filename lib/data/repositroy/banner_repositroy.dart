import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/banner_dataSorce.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:dartz/dartz.dart';

abstract class IBannerRepositroy {
  Future<Either<String, List<BannerProducts>>> getBanner();
}

class BannerRepository implements IBannerRepositroy {
  @override
  Future<Either<String, List<BannerProducts>>> getBanner() async {
    final IBannerDataSorce dataSorce = locator.get();
    try {
      var responce = await dataSorce.grtBanners();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'حظا نا مشخص');
    }
  }
}
