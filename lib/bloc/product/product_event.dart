part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductInitEvent extends ProductEvent {
  final String productId;
  final String categoryId;

  const ProductInitEvent({
    required this.productId,
    required this.categoryId,
  });
}
