import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/repositroy/catrgory_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepositroy _categoryRepositroy = locator.get();
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryReqiestEvent>((event, emit) async {
      emit(CategoryLoading());
      var response = await _categoryRepositroy.getCategories();
      emit(CategoryResponce(response));
    });
  }
}
