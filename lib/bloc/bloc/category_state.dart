part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryResponce extends CategoryState {
  final Either<String, List<CategoryItems>> response;

  const CategoryResponce(this.response);
}
