import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/producs_model.dart';
import 'package:appleshop1/data/repositroy/category_products_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'categorybloc_event.dart';
part 'categorybloc_state.dart';

class CategoryProductBloc
    extends Bloc<CategoryblocEvent, CategoryProductState> {
  final ICategoryProductsRepositoey _categoryProductsRepositoey = locator.get();
  CategoryProductBloc() : super(CategoryblocInitial()) {
    on<CategoryProductInitEvent>((event, emit) async {
      var category =
          await _categoryProductsRepositoey.getCategoryById(event.categoryId);

      emit(CategoryProductResponceState(category));
    });
  }
}
