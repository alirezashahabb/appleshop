import 'package:appleshop1/data/model/comment.dart';
import 'package:appleshop1/data/repositroy/comment_repositroy.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ICommentRepositroy comment;
  CommentBloc(this.comment) : super(CommentInitialState()) {
    on<CommentInitEvent>((event, emit) async {
      emit(CommentLoadingState());
      var responce = await comment.getComment(event.productId);
      emit(CommentResponceState(responce));
    });
  }
}
