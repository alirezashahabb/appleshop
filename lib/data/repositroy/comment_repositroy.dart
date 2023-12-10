import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/comment_datasource.dart';
import 'package:appleshop1/data/model/comment.dart';
import 'package:dartz/dartz.dart';

abstract class ICommentRepositroy {
  Future<Either<String, List<CommentList>>> getComment(String productId);
}

class CommentRepositroy implements ICommentRepositroy {
  final ICommentDataSorce _commentDataSorce = locator.get();
  @override
  Future<Either<String, List<CommentList>>> getComment(String productId) async {
    try {
      var responce = await _commentDataSorce.grtcomment(productId);
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }
}
