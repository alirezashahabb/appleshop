part of 'categoty_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  final Either<String, List<CategoryModel>> getCategory;

  const CategoryResponseState({required this.getCategory});
  @override
  // TODO: implement props
  List<Object> get props => [getCategory];
}
