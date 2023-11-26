import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/producs_model.dart';
import 'package:dio/dio.dart';

abstract class ICategoryProductsDataSorce {
  Future<List<ProdcutsList>> getCategoryProducts(String categoryId);
}

class CategoryProductsRemoteDataSorce implements ICategoryProductsDataSorce {
  final Dio _dio = locator.get();
  @override
  Future<List<ProdcutsList>> getCategoryProducts(String categoryId) async {
    try {
      Map<String, String> qprams = {'filter': 'category="$categoryId"'};
      Response response;

      // get all products by id
      if (categoryId == '78q8w901e6iipuk') {
        response = await _dio.get(
          'collections/products/records',
        );
      } else {
        response = await _dio.get('collections/products/records',
            queryParameters: qprams);
      }

      return response.data['items']
          .map<ProdcutsList>((jsonMap) => ProdcutsList.fromJson(jsonMap))
          .toList();
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }
  }
}
