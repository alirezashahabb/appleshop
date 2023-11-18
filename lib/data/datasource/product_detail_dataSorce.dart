import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/gallery.dart';
import 'package:appleshop1/data/model/product_varaint.dart';
import 'package:appleshop1/data/model/variant_type.dart';
import 'package:appleshop1/data/model/varint.dart';
import 'package:dio/dio.dart';

abstract class IProductDetialDataSorce {
  Future<List<ProductGallery>> getGaller();
  Future<List<VariantType>> varaintType();
  Future<List<Varaints>> varaintProducts();
  Future<List<ProdductVaraint>> getproductVaraint();
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

  /// this is for Varaint Type
  @override
  Future<List<VariantType>> varaintType() async {
    try {
      Response response = await dio.get(
        'collections/variants_type/records',
      );

      return response.data['items']
          .map<VariantType>(
            (jsonMap) => VariantType.fromJson(jsonMap),
          )
          .toList();
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }
  }

  @override
  Future<List<Varaints>> varaintProducts() async {
    Map<String, String> qprams = {'filter': 'product_id="0tc0e5ju89x5ogj"'};
    try {
      Response response = await dio.get(
        'collections/variants/records',
        queryParameters: qprams,
      );

      return response.data['items']
          .map<Varaints>(
            (jsonMap) => Varaints.fromJson(jsonMap),
          )
          .toList();
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }
  }

  @override
  Future<List<ProdductVaraint>> getproductVaraint() async {
    var varinatTypeList = await varaintType();
    var varintList = await varaintProducts();

    List<ProdductVaraint> productVarintList = [];

    for (var varintType in varinatTypeList) {
      var varianList = varintList
          .where((element) => element.typeId == varintType.id)
          .toList();

      productVarintList.add(ProdductVaraint(varintType, varianList));
    }

    return productVarintList;
  }
}
