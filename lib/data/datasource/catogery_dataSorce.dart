import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:dio/dio.dart';

abstract class IcategoryDataSorce {
  Future<List<CategoryItems>> getCategories();
}

class CategoryRemoteDataSorce implements IcategoryDataSorce {
  final Dio _dio = locator.get();
  @override
  Future<List<CategoryItems>> getCategories() async {
    try {
      Response response = await _dio.get('collections/category/records');

      return response.data['items']
          .map<CategoryItems>((jsonMap) => CategoryItems.fromJson(jsonMap))
          .toList();
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }
  }
}
