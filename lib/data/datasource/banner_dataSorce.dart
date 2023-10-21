import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:dio/dio.dart';

abstract class IBannerDataSorce {
  Future<List<BannerProducts>> grtBanners();
}

class BannerRemoteDataSorce implements IBannerDataSorce {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerProducts>> grtBanners() async {
    try {
      Response response = await _dio.get('collections/banner/records');
      return response.data['items']
          .map<BannerProducts>((jsonmap) => BannerProducts.fromJson(jsonmap))
          .toList();
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }
  }
}
