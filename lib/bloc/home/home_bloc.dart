import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/producs_model.dart';
import 'package:appleshop1/data/repositroy/banner_repositroy.dart';
import 'package:appleshop1/data/repositroy/catrgory_repository.dart';
import 'package:appleshop1/data/repositroy/products_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// get repository
  final IBannerRepositroy _bannerRepositroy = locator.get();
  final ICategoryRepositroy _categoryRepositroy = locator.get();
  final IProductsRepository _productsRepository = locator.get();

  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitEvent>((event, emit) async {
      emit(HomeLoadingstate());
      var bannerList = await _bannerRepositroy.getBanner();
      final categories = await _categoryRepositroy.getCategories();
      final products = await _productsRepository.getproducts();
      emit(
        HomeResponceState(bannerList, categories, products),
      );
    });
  }
}
