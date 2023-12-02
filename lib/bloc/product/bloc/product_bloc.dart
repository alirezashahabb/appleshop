import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/cart_item.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/producs_model.dart';
import 'package:appleshop1/data/model/product_varaint.dart';
import 'package:appleshop1/data/model/propreties.dart';
import 'package:appleshop1/data/repositroy/basket_item_repository.dart';
import 'package:appleshop1/data/repositroy/product_detial_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/gallery.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRepositroy _detailRepositroy = locator.get();
  final IBasketRepository _basketrepositroy = locator.get();
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
        final propertis =
            await _detailRepositroy.getpropertis(event.prodocutId);
        emit(ProductResponseState(
            gallery, prodctVaraints, categories, propertis));
      },
    );

    /// add Basket local datasource to Cart Event
    on<ProductAddToBasketEvent>(
      (event, emit) {
        var item = BasketItem(
          event.prodcutsList.id,
          event.prodcutsList.collectionId,
          event.prodcutsList.thumnail,
          event.prodcutsList.discountprice,
          event.prodcutsList.price,
          event.prodcutsList.name,
          event.prodcutsList.categoryId,
        );
        _basketrepositroy.addProductToBasket(item);
      },
    );
  }
}
