import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/common/peyment_handler.dart';
import 'package:appleshop1/data/model/cart_item.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../data/repositroy/basket_item_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final IBasketRepository _basketrepositroy = locator.get();
  final PaymentHandler _paymentHandler;

  CartBloc(this._paymentHandler) : super(CartInitial()) {
    on<CartRequestDataEvent>(
      (event, emit) async {
        var repsonce = await _basketrepositroy.getAllBasketItem();
        var finalPrice = await _basketrepositroy.getBasketFinalPrice();
        emit(
          CartFeatchHiveState(repsonce, finalPrice),
        );
      },
    );

    /// this event for ZarinPal
    on<BasketPeymentInitEvent>(
      (event, emit) {
        _paymentHandler.initPaymentRequest();
      },
    );

    /// this event for Peyment
    on<BasketPeymentRequistEvent>(
      (event, emit) {
        _paymentHandler.sendPaymentRequest();
        _paymentHandler.verifyPaymentRequest();
      },
    );
  }
}
