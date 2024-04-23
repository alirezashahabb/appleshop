import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/repositroy/category_repositroy.dart';
import 'package:appleshop1/di/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'categoty_event.dart';
part 'categoty_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _categoryRepository = locator.get();
  CategoryBloc() : super(CategoryInitialState()) {
    on<CategoryEvent>((event, emit) async {
      if (event is CategoryInitEvent) {
        emit(CategoryLoadingState());
        var response = await _categoryRepository.getCategory();
        emit(
          CategoryResponseState(getCategory: response),
        );
      }
    });
  }
}
