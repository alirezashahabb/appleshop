import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:appleshop1/data/model/product_model.dart';
import 'package:appleshop1/di/di.dart';
import 'package:dio/dio.dart';

abstract class IHomeDataSource {
  Future<List<BannerModel>> getBanner();
  Future<List<ProductModel>> getProduct();
  Future<List<ProductModel>> getHottest();
  Future<List<ProductModel>> getBestSeller();
}

class HomeDataSource extends IHomeDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerModel>> getBanner() async {
    try {
      Response response = await _dio.get('collections/banner/records');
      return response.data['items']
          .map<BannerModel>((jsonMap) => BannerModel.fromJson(jsonMap))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }

  /// this id for products
  @override
  Future<List<ProductModel>> getProduct() async {
    try {
      Response response = await _dio.get('collections/products/records');
      return response.data['items']
          .map<ProductModel>((jsonMap) => ProductModel.fromJson(jsonMap))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }

  /// this is for get hottest product
  @override
  Future<List<ProductModel>> getBestSeller() async {
    Map<String, String> qPrams = {"filter": 'popularity="Best Seller"'};

    try {
      Response response = await _dio.get('collections/products/records',
          queryParameters: qPrams);
      return response.data['items']
          .map<ProductModel>((jsonMap) => ProductModel.fromJson(jsonMap))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<ProductModel>> getHottest() async {
    Map<String, String> qPrams = {"filter": 'popularity="Hotest"'};

    try {
      Response response = await _dio.get('collections/products/records',
          queryParameters: qPrams);
      return response.data['items']
          .map<ProductModel>((jsonMap) => ProductModel.fromJson(jsonMap))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }
}
