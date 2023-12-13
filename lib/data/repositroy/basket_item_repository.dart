import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/basket_item_dataSource.dart';
import 'package:appleshop1/data/model/cart_item.dart';
import 'package:dartz/dartz.dart';

abstract class IBasketRepository {
  Future<Either<String, String>> addProductToBasket(BasketItem basketItem);
  Future<Either<String, List<BasketItem>>> getAllBasketItem();
  Future<int> getBasketFinalPrice();
  Future<void> removeProduct(int index);
}

class BasketRepository extends IBasketRepository {
  final IBasketDataSorce basketDataSorce = locator.get();
  @override
  Future<Either<String, String>> addProductToBasket(
      BasketItem basketItem) async {
    try {
      basketDataSorce.addProduct(basketItem);
      return const Right('محصول با موفقیت به سبد خرید شما اضافه شد');
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خظا در افزودن به سبد خرید');
    }
  }

  @override
  Future<Either<String, List<BasketItem>>> getAllBasketItem() async {
    try {
      var responce = await basketDataSorce.addBasket();
      return Right(responce);
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خطا نا مشخص');
    }
  }

  @override
  Future<int> getBasketFinalPrice() async {
    return basketDataSorce.getBasketFinalPrice();
  }

  @override
  Future<void> removeProduct(int index) async {
    basketDataSorce.removeProduct(index);
  }
}
