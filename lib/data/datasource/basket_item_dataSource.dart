import 'package:appleshop1/data/model/cart_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IBasketDataSorce {
  Future<void> addProduct(BasketItem addItem);
  Future<List<BasketItem>> addBasket();
}

class BaskteILocalDataSorce extends IBasketDataSorce {
  var box = Hive.box<BasketItem>('CartBox');

  @override
  Future<void> addProduct(BasketItem addItem) async {
    box.add(addItem);
  }

  @override
  Future<List<BasketItem>> addBasket() async {
    return box.values.toList();
  }
}
