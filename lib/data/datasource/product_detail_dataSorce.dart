import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/gallery.dart';
import 'package:dio/dio.dart';

abstract class IProductDetialDataSorce {
  Future<List<ProductGallery>> getGaller();
}

class ProducDetailRemoteDataSorce extends IProductDetialDataSorce {
  @override
  final Dio dio = locator.get();
  @override
  Future<List<ProductGallery>> getGaller() async {
    Map<String, String> qprams = {'filter': 'product_id="0tc0e5ju89x5ogj"'};
    try {
      Response response =
          await dio.get('collections/gallery/records', queryParameters: qprams);

      return response.data['items']
          .map<ProductGallery>((jsonMap) => ProductGallery.fromJson(jsonMap))
          .toList();
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }
  }
}
