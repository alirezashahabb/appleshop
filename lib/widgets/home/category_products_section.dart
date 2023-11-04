import 'package:appleshop1/bloc/product/bloc/product_bloc.dart';
import 'package:appleshop1/common/cached_image_network.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/data/model/producs_model.dart';
import 'package:appleshop1/screens/shop_deatil_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this class for Category Products
class CategoryProducts extends StatelessWidget {
  final List<ProdcutsList> productsList;
  const CategoryProducts({
    super.key,
    required this.productsList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 218,
      child: ListView.builder(
        itemCount: productsList.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 20),
        itemBuilder: (context, index) {
          return ProductsItems(
            products: productsList[index],
          );
        },
      ),
    );
  }
}

/// this Class for Products Items
class ProductsItems extends StatelessWidget {
  final ProdcutsList products;
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
            builder: (context) => BlocProvider(
              create: (context) {
                var bloc = ProductBloc();
                bloc.add(
                  ProductInitEvent(),
                );
                return bloc;
              },
              child: const ProductDetailScreen(),
            ),
          ));
        },
        child: Container(
          height: 216,
          width: 160,
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
                      height: 96,
                      width: 100,
                      child: CachedImage(imageUrl: products.thumnail)),
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
                          '${products.percent!.round().toString()}%',
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
                    const Text(
                      'تومان',
                      style: TextStyle(
                        fontFamily: 'Sm',
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          products.price.toString(),
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontFamily: 'Sm',
                            fontSize: 10,
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
                    Image.asset(
                      'assets/images/icon_right_arrow_cricle.png',
                      width: 30,
                      height: 30,
                    )
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
