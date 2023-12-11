part of 'comment_bloc.dart';

class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class CommentInitEvent extends CommentEvent {
  final String productId;

  const CommentInitEvent(this.productId);
}
