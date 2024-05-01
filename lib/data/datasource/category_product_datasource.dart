import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/data/model/product_model.dart';
import 'package:appleshop1/di/di.dart';
import 'package:dio/dio.dart';

abstract class ICategoryProductDataSource {
  Future<List<ProductModel>> getCategoryById(String id);
}

class CategoryProductRemoteDataSource extends ICategoryProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductModel>> getCategoryById(String categoryId) async {
    Map<String, String> qPrams = {"filter": 'category="$categoryId"'};
    try {
      Response response = await _dio.get(
        'collections/products/records',
        queryParameters: qPrams,
      );
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
