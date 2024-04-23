part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  final Either<String, List<BannerModel>> banners;
  final Either<String, List<CategoryModel>> categories;
  final Either<String, List<ProductModel>> products;
  final Either<String, List<ProductModel>> bestSeller;
  final Either<String, List<ProductModel>> hottest;

  const HomeResponseState(
      {required this.banners,
      required this.categories,
      required this.products,
      required this.bestSeller,
      required this.hottest});

  @override
  List<Object> get props => [
        banners,
        categories,
        products,
        bestSeller,
        hottest,
      ];
}
