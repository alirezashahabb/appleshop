import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:appleshop1/data/repositroy/banner_repositroy.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepositroy _bannerRepositroy = locator.get();
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitEvent>((event, emit) async {
      emit(HomeLoadingstate());
      var bannerList = await _bannerRepositroy.getBanner();
      emit(HomeResponceState(bannerList));
    });
  }
}
