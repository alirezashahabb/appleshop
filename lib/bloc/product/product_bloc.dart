import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/galley_model.dart';
import 'package:appleshop1/data/model/product_varaint_model.dart';
import 'package:appleshop1/data/repositroy/product_detail_repositroy.dart';
import 'package:appleshop1/di/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRepository _detailRepository = locator.get();
  ProductBloc() : super(ProductInitialState()) {
    on<ProductEvent>(
      (event, emit) async {
        if (event is ProductInitEvent) {
          emit(ProductLoadingSate());
          final gallery = await _detailRepository.getGallery(event.productId);
          final productVariant =
              await _detailRepository.getProductVariant(event.productId);
          final productCategroy =
              await _detailRepository.getProductCategory(event.categoryId);

          emit(
            ProductResponseState(
                productGallery: gallery,
                productVariant: productVariant,
                productCategory: productCategroy),
          );
        }
      },
    );
  }
}
