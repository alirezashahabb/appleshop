part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingSate extends ProductState {}

class ProductResponseState extends ProductState {
  final Either<String, List<GalleryModel>> productGallery;
  final Either<String, List<ProductVariantModel>> productVariant;
  final Either<String, CategoryModel> productCategory;

  const ProductResponseState(
      {required this.productGallery,
      required this.productVariant,
      required this.productCategory});

  @override
  List<Object> get props => [productGallery, productVariant, productCategory];
}
