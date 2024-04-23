import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/common/image_loading_service.dart';
import 'package:appleshop1/data/model/product_model.dart';
import 'package:appleshop1/screens/shop_deatil_screen.dart';
import 'package:flutter/material.dart';

/// this class for Category Products
class CategoryProducts extends StatelessWidget {
  final List<ProductModel> products;
  const CategoryProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 20),
        itemBuilder: (context, index) {
          return ProductsItems(
            products: products[index],
          );
        },
      ),
    );
  }
}

/// this Class for Products Items
class ProductsItems extends StatelessWidget {
  final ProductModel products;
  const ProductsItems({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productModel: products),
          ));
        },
        child: Container(
          height: 216,
          width: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox(
                      width: 92,
                      height: 100,
                      child: ImageLoadingService(imageUrl: products.thumbnail)),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Image.asset('assets/images/active_fav_product.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CustomColors.primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 5),
                        child: Text(
                          '${products.present!.round().toString()}%',
                          style: const TextStyle(
                            fontFamily: 'Sm',
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  products.name,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: const TextStyle(fontFamily: 'Sm'),
                ),
              ),
              const Spacer(),
              Container(
                height: 54,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.mainColor,
                      blurRadius: 20,
                      spreadRadius: -12,
                      offset: Offset(0, 15),
                    )
                  ],
                  color: CustomColors.mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/icon_right_arrow_cricle.png',
                      width: 30,
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          products.price.toString(),
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontFamily: 'Sm',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          products.realPrice.toString(),
                          style: const TextStyle(
                            fontFamily: 'Sm',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'تومان',
                      style: TextStyle(
                        fontFamily: 'Sm',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
