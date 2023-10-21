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

  const HomeResponceState(this.banners);
}
