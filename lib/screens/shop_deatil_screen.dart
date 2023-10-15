import 'dart:ui';

import 'package:appleshop1/common/color.dart';
import 'package:flutter/material.dart';

class ShopDetailScreen extends StatelessWidget {
  const ShopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: 46,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset('assets/images/icon_apple_blue.png'),
                    const Expanded(
                      child: Text(
                        'آیفون',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Sb',
                          color: CustomColors.mainColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Image.asset('assets/images/icon_back.png'),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'آیفون13 پرو مکس',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Sb',
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 44),
                height: 284,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/icon_star.png'),
                            const Text(
                              '4.7',
                              style: TextStyle(
                                fontFamily: 'Sm',
                                fontSize: 11,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                                height: double.infinity,
                                child: Image.asset('assets/images/iphone.png')),
                            const Spacer(),
                            Image.asset(
                                'assets/images/icon_favorite_deactive.png'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: ListView.builder(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 40 - 12),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 12),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: CustomColors.mainTextcolor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset('assets/images/iphone.png'),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            //================================================>>>>>> Chose Color
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'انتخاب رنگ',
                      style: TextStyle(
                        fontFamily: 'Sb',
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //==================================================================Choos Varidant
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'انتخاب حافظه داخلی',
                      style: TextStyle(
                        fontFamily: 'Sb',
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 74,
                          height: 26,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: CustomColors.mainTextcolor,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '128',
                            style: TextStyle(
                              fontFamily: 'Sb',
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 74,
                          height: 26,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: CustomColors.mainTextcolor,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '128',
                            style: TextStyle(
                              fontFamily: 'Sb',
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 74,
                          height: 26,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: CustomColors.mainTextcolor,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '128',
                            style: TextStyle(
                              fontFamily: 'Sb',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //=======================================>>>>>> Technical Specifications
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 15),
                child: Container(
                  alignment: Alignment.center,
                  height: 46,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: CustomColors.mainTextcolor,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset('assets/images/icon_left_categroy.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'مشاهده',
                          style: TextStyle(
                            fontFamily: 'Sb',
                            fontSize: 14,
                            color: CustomColors.mainColor,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          ':مشخصات فنی',
                          style: TextStyle(
                            fontFamily: 'Sb',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //=======================================>>>>>> About Products
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 15),
                child: Container(
                  alignment: Alignment.center,
                  height: 46,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: CustomColors.mainTextcolor,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset('assets/images/icon_left_categroy.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'مشاهده',
                          style: TextStyle(
                            fontFamily: 'Sb',
                            fontSize: 14,
                            color: CustomColors.mainColor,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          ':توضیحات محصول',
                          style: TextStyle(
                            fontFamily: 'Sb',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //=======================================>>>>>>  Users Comments
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 15),
                child: Container(
                  alignment: Alignment.center,
                  height: 46,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: CustomColors.mainTextcolor,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset('assets/images/icon_left_categroy.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'مشاهده',
                          style: TextStyle(
                            fontFamily: 'Sb',
                            fontSize: 14,
                            color: CustomColors.mainColor,
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            Positioned(
                              right: 15,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 30,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 45,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 60,
                              child: Container(
                                alignment: Alignment.center,
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  '+10',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Sm',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          ':نظر کاربران ',
                          style: TextStyle(
                            fontFamily: 'Sb',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ShopDetails(), AddBasket()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// this Class for AddBasket in Shop
class AddBasket extends StatelessWidget {
  const AddBasket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 47,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: CustomColors.mainColor,
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 6,
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 53,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'افزودن به سبد خرید',
                    style: TextStyle(fontFamily: 'Sm', color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// this Class for ShopDetals
class ShopDetails extends StatelessWidget {
  const ShopDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 47,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: CustomColors.greenColor,
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 6,
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 53,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'تومان',
                      style: TextStyle(fontFamily: 'Sm', color: Colors.white),
                    ),
                    const Column(
                      children: [
                        Text(
                          '۱۷٬۸۰۰٬۰۰۰',
                          style: TextStyle(
                              fontFamily: 'Sm',
                              color: Colors.white,
                              fontSize: 10),
                        ),
                        Text(
                          '۱۶٬۹۸۹٬۰۰۰',
                          style:
                              TextStyle(fontFamily: 'Sm', color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 25,
                      height: 15,
                      decoration: BoxDecoration(
                        color: CustomColors.primaryColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Text(
                        '5%',
                        style: TextStyle(
                            fontFamily: 'Sm',
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
