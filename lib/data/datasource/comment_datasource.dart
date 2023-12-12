import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/comment.dart';
import 'package:dio/dio.dart';

abstract class ICommentDataSorce {
  Future<List<CommentList>> grtcomment(String productId);
  Future<void> postComment(String productId, String text);
}

class CommentRemoteDataSorce extends ICommentDataSorce {
  final Dio dio = locator.get();
  @override
  Future<List<CommentList>> grtcomment(String productId) async {
    Map<String, String> qprams = {
      'filter': 'product_id ="$productId"',
      'expand': 'user_id'
    };
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

  @override
  Future<void> postComment(String productId, String text) async {
    try {
      await dio.post(
        'collections/comment/records',
        data: {
          'product_id': productId,
          'user_id': '8nzv4ubo59ohmbp',
          'text': text,
        },
      );
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }
  }
}
