part of 'cart_bloc.dart';

class CartState {
  const CartState();
}

class CartInitial extends CartState {}

class CartFeatchHiveState extends CartState {
  final Either<String, List<BasketItem>> basketItems;

  const CartFeatchHiveState(this.basketItems);
}
