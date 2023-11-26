part of 'categorybloc_bloc.dart';

class CategoryblocEvent extends Equatable {
  const CategoryblocEvent();

  @override
  List<Object> get props => [];
}

class CategoryProductInitEvent extends CategoryblocEvent {
  final String categoryId;

  const CategoryProductInitEvent(this.categoryId);
}
