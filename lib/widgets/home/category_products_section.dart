import 'package:appleshop1/common/color.dart';
import 'package:flutter/material.dart';

/// this class for Category Products
class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 218,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 20),
        itemBuilder: (context, index) {
          return const ProductsItems();
        },
      ),
    );
  }
}

/// this Class for Products Items
class ProductsItems extends StatelessWidget {
  const ProductsItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: 216,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Expanded(
                  child: Container(),
                ),
                Image.asset('assets/images/iphone.png'),
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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      child: Text(
                        '3%',
                        style: TextStyle(
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'ایفون 14 پرو مکس',
                style: TextStyle(fontFamily: 'Sm'),
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
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '11,480,000',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontFamily: 'Sm',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '11,400,000',
                        style: TextStyle(
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
    );
  }
}
