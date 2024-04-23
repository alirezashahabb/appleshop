import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/galley_model.dart';
import 'package:appleshop1/data/model/product_varaint_model.dart';
import 'package:appleshop1/data/model/varaint.dart';
import 'package:appleshop1/data/model/variant_type.dart';
import 'package:appleshop1/di/di.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource {
  Future<List<GalleryModel>> getGallery(String productId);
  Future<List<VariantTypeModel>> getVariantType();
  Future<List<VariantModel>> getVarian(String id);
  Future<List<ProductVariantModel>> getProductVariant(String id);
  Future<CategoryModel> getProductCategory(String productId);
}

class ProductRemoteDataSource extends IProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<GalleryModel>> getGallery(String productId) async {
    Map<String, String> qPrams = {"filter": 'product_id="$productId"'};
    try {
      Response response = await _dio.get('collections/gallery/records',
          queryParameters: qPrams);
      return response.data['items']
          .map<GalleryModel>((jsonMap) => GalleryModel.fromJson(jsonMap))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }

  /// this class get Variant type from Api
  @override
  Future<List<VariantTypeModel>> getVariantType() async {
    try {
      Response response = await _dio.get(
        'collections/variants_type/records',
      );
      return response.data['items']
          .map<VariantTypeModel>(
              (jsonMap) => VariantTypeModel.fromJson(jsonMap))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }

  /// this class get variant from Api
  @override
  Future<List<VariantModel>> getVarian(String id) async {
    Map<String, String> qPrams = {"filter": 'product_id="$id"'};
    try {
      Response response = await _dio.get('collections/variants/records',
          queryParameters: qPrams);
      return response.data['items']
          .map<VariantModel>((jsonMap) => VariantModel.fromJson(jsonMap))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }

  /// this class set product by variantModel and variantType model
  @override
  Future<List<ProductVariantModel>> getProductVariant(String id) async {
    var variantTypeList = await getVariantType();
    var variantList = await getVarian(id);
    List<ProductVariantModel> productVariantList = [];
    for (var variantType in variantTypeList) {
      var variant = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();

      productVariantList.add(
          ProductVariantModel(variantTypeModel: variantType, variant: variant));
    }
    return productVariantList;
  }

  /// this class category Name from ProdctDetail
  @override
  Future<CategoryModel> getProductCategory(String productId) async {
    Map<String, String> qPrams = {"filter": 'id="$productId"'};

    try {
      Response response = await _dio.get('collections/category/records',
          queryParameters: qPrams);
      return CategoryModel.fromJson(
        response.data['items'][0],
      );
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }
}
