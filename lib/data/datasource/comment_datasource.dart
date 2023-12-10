import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/comment.dart';
import 'package:dio/dio.dart';

abstract class ICommentDataSorce {
  Future<List<CommentList>> grtcomment(String productId);
}

class CommentRemoteDataSorce extends ICommentDataSorce {
  @override
  Future<List<CommentList>> grtcomment(String productId) async {
    final Dio dio = locator.get();
    Map<String, String> qprams = {'filter': 'product_id ="$productId"'};
    try {
      Response response =
          await dio.get('collections/comment/records', queryParameters: qprams);

      return response.data['items']
          .map<CommentList>((jsonMap) => CommentList.fromJson(jsonMap))
          .toList();
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }
  }
}
