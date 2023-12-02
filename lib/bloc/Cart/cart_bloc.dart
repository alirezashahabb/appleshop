import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/cart_item.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../data/repositroy/basket_item_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final IBasketRepository _basketrepositroy = locator.get();
  CartBloc() : super(CartInitial()) {
    on<CartRequestDataEvent>((event, emit) async {
      var repsonce = await _basketrepositroy.getAllBasketItem();
      emit(CartFeatchHiveState(repsonce));
    });
  }
}
