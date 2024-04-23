import 'package:appleshop1/data/model/banner_model.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/product_model.dart';
import 'package:appleshop1/data/repositroy/category_repositroy.dart';
import 'package:appleshop1/data/repositroy/home_repositroy.dart';
import 'package:appleshop1/di/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository _homeRepository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitEvent) {
        emit(HomeLoadingState());

        var bannerList = await _homeRepository.getBanner();
        var categories = await _categoryRepository.getCategory();
        var products = await _homeRepository.getProducts();
        var bestSeller = await _homeRepository.getBestSeller();
        var hottest = await _homeRepository.getHottest();
        emit(
          HomeResponseState(
              banners: bannerList,
              categories: categories,
              products: products,
              bestSeller: bestSeller,
              hottest: hottest),
        );
      }
    });
  }
}
