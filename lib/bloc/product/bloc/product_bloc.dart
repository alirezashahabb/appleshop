import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/product_varaint.dart';
import 'package:appleshop1/data/repositroy/product_detial_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/gallery.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRepositroy _detailRepositroy = locator.get();
  ProductBloc() : super(ProductInitial()) {
    on<ProductInitEvent>(
      (event, emit) async {
        emit(ProductLoadingState());
        final gallery =
            await _detailRepositroy.getProducGallery(event.prodocutId);
        final prodctVaraints =
            await _detailRepositroy.getprodctVaraint(event.prodocutId);
        final categories =
            await _detailRepositroy.getCatgories(event.categoryId);
        emit(ProductResponseState(gallery, prodctVaraints, categories));
      },
    );
  }
}
