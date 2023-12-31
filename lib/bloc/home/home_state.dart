part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingstate extends HomeState {}

class HomeResponceState extends HomeState {
  final Either<String, List<BannerProducts>> banners;
  final Either<String, List<CategoryItems>> categories;
  final Either<String, List<ProdcutsList>> products;
  final Either<String, List<ProdcutsList>> bestSllers;
  final Either<String, List<ProdcutsList>> hotest;

  const HomeResponceState(this.banners, this.categories, this.products,
      this.bestSllers, this.hotest);
}
