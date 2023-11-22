part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductInitEvent extends ProductEvent {
  final String prodocutId;
  final String categoryId;

  const ProductInitEvent(this.prodocutId, this.categoryId);
}
