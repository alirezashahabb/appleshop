part of 'comment_bloc.dart';

class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitialState extends CommentState {}

class CommentLoadingState extends CommentState {}

class CommentResponceState extends CommentState {
  final Either<String, List<CommentList>> getComment;

  const CommentResponceState(this.getComment);
}
