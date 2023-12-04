import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/model/cart_item.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

import '../../data/repositroy/basket_item_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final IBasketRepository _basketrepositroy = locator.get();
  final PaymentRequest _paymentRequest = PaymentRequest();
  CartBloc() : super(CartInitial()) {
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
        _paymentRequest.setIsSandBox(true);
        _paymentRequest.setAmount(10000);

        _paymentRequest.setDescription('تست محصول نهایی برای خرید');
        _paymentRequest.setMerchantID('d645fba8-1b29-11ea-be59-000c295eb8fc');
        _paymentRequest.setCallbackURL('alireza://shahab');
      },
    );

    /// this event for Peyment
    on<BasketPeymentRequistEvent>(
      (event, emit) {
        ZarinPal().startPayment(
          _paymentRequest,
          (status, paymentGatewayUri) {
            if (status == 100) {
              launchUrl(Uri.parse(paymentGatewayUri!),
                  mode: LaunchMode.externalApplication);
            }
          },
        );
      },
    );
  }
}
