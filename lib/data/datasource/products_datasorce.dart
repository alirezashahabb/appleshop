import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:dio/dio.dart';

import '../model/producs_model.dart';

abstract class IProductsDataSorce {
  Future<List<ProdcutsList>> getProducts();
}

class PrdocutsRemoteDataSorce implements IProductsDataSorce {
  final Dio _dio = locator.get();
  @override
  Future<List<ProdcutsList>> getProducts() async {
    try {
      Response response = await _dio.get('collections/products/records');

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
