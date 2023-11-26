part of 'categorybloc_bloc.dart';

class CategoryProductState extends Equatable {
  const CategoryProductState();

  @override
  List<Object> get props => [];
}

class CategoryblocInitial extends CategoryProductState {}

class CategoryProductResponceState extends CategoryProductState {
  final Either<String, List<ProdcutsList>> categoreis;

  const CategoryProductResponceState(this.categoreis);
}
