part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductResponseState extends ProductState {
  final Either<String, List<ProductGallery>> galleryList;
  final Either<String, List<ProdductVaraint>> varint;
  final Either<String, CategoryItems> categories;
  final Either<String, List<Properties>> propertis;

  const ProductResponseState(
      this.galleryList, this.varint, this.categories, this.propertis);
}
