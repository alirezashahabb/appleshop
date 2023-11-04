import 'package:appleshop1/common/di.dart';
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
        final repsonse = await _detailRepositroy.getProducGallery();
        emit(ProductResponseState(repsonse));
      },
    );
  }
}
