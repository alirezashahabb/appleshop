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

  const ProductResponseState(this.galleryList);
}


