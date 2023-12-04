part of 'cart_bloc.dart';

class CartEvent {
  const CartEvent();
}

class CartRequestDataEvent extends CartEvent {}

/// this event for ZarinPal
class BasketPeymentInitEvent extends CartEvent {}

/// this event for Peyment
class BasketPeymentRequistEvent extends CartEvent {}
