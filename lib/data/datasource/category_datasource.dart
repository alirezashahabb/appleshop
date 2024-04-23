import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/di/di.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDataSource {
  Future<List<CategoryModel>> getcategory();
}

class CategoryRemoteDataSource extends ICategoryDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<CategoryModel>> getcategory() async {
    try {
      Response response = await _dio.get('collections/category/records');
      return response.data['items']
          .map<CategoryModel>((jsonMap) => CategoryModel.fromJson(jsonMap))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }
}
