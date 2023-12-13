part of 'cart_bloc.dart';

class CartEvent {
  const CartEvent();
}

class CartRequestDataEvent extends CartEvent {}

/// this event for ZarinPal
class BasketPeymentInitEvent extends CartEvent {}

/// this event for Peyment
class BasketPeymentRequistEvent extends CartEvent {}

/// this event for Remove product form Basket
class BaskeRemoveEvent extends CartEvent {
  final int index;

  BaskeRemoveEvent(this.index);
}
