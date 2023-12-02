import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 0)
class BasketItem {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String collectionId;
  @HiveField(2)
  final String thumnail;
  @HiveField(3)
  final int discountprice;
  @HiveField(4)
  final int price;
  @HiveField(5)
  final String name;
  @HiveField(6)
  final String categoryId;
  @HiveField(7)
  int? realPrice;
  @HiveField(8)
  num? percent;

  BasketItem(this.id, this.collectionId, this.thumnail, this.discountprice,
      this.price, this.name, this.categoryId) {
    /// this is calculator realPrice
    realPrice = price + discountprice;
    percent = ((price - realPrice!) / price) * 100;
  }
}

// 'http://startflutter.ir/api/files/${jsonMap['collectionId']}/${jsonMap['id']}/${jsonMap['thumbnail']}',


/// this is for Build
// dart run build_runner build