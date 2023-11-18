import 'dart:ui';

import 'package:appleshop1/bloc/product/bloc/product_bloc.dart';
import 'package:appleshop1/common/cached_image_network.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/data/model/gallery.dart';
import 'package:appleshop1/data/model/product_varaint.dart';
import 'package:appleshop1/data/model/varint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state is ProductLoadingState) ...[
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
                const GetTtitle(),
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

                if (state is ProductResponseState) ...[
                  state.galleryList.fold((errorMessage) {
                    return SliverToBoxAdapter(
                      child: Text(errorMessage),
                    );
                  }, (galleyList) {
                    return GetGalley(
                      galleyProducts: galleyList,
                    );
                  })
                ],

                if (state is ProductResponseState) ...{
                  state.varint.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (productVaraintList) =>
                        ContinerVaraint(productList: productVaraintList),
                  )
                },

                // //==================================================================Choos Varidant
                // SliverToBoxAdapter(
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 44, vertical: 5),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       children: [
                //         const Text(
                //           'انتخاب حافظه داخلی',
                //           style: TextStyle(
                //             fontFamily: 'Sb',
                //             fontSize: 12,
                //           ),
                //         ),
                //         const SizedBox(
                //           height: 10,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             Container(
                //               alignment: Alignment.center,
                //               width: 74,
                //               height: 26,
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                   width: 1,
                //                   color: CustomColors.mainTextcolor,
                //                 ),
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(8),
                //               ),
                //               child: const Text(
                //                 '128',
                //                 style: TextStyle(
                //                   fontFamily: 'Sb',
                //                   fontSize: 12,
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(
                //               width: 8,
                //             ),
                //             Container(
                //               alignment: Alignment.center,
                //               width: 74,
                //               height: 26,
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                   width: 1,
                //                   color: CustomColors.mainTextcolor,
                //                 ),
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(8),
                //               ),
                //               child: const Text(
                //                 '128',
                //                 style: TextStyle(
                //                   fontFamily: 'Sb',
                //                   fontSize: 12,
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(
                //               width: 8,
                //             ),
                //             Container(
                //               alignment: Alignment.center,
                //               width: 74,
                //               height: 26,
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                   width: 1,
                //                   color: CustomColors.mainTextcolor,
                //                 ),
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(8),
                //               ),
                //               child: const Text(
                //                 '128',
                //                 style: TextStyle(
                //                   fontFamily: 'Sb',
                //                   fontSize: 12,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                //=======================================>>>>>> Technical Specifications
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 15),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 15),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 15),
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
          );
        },
      ),
    );
  }
}

/// ==========================================================>>>>>this class for Color Varaint For Prodducts
class ContinerVaraint extends StatelessWidget {
  final List<ProdductVaraint> productList;
  const ContinerVaraint({
    super.key,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              productList[1].variantType.title,
              style: const TextStyle(
                fontFamily: 'Sb',
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StrogeVaraint(varaintListStorge: productList[1].variltList)
          ],
        ),
      ),
    );
  }
}

/// this class for galley
class GetGalley extends StatefulWidget {
  final List<ProductGallery> galleyProducts;

  const GetGalley({
    super.key,
    required this.galleyProducts,
  });

  @override
  State<GetGalley> createState() => _GetGalleyState();
}

class _GetGalleyState extends State<GetGalley> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                    Row(
                      children: [
                        Image.asset('assets/images/icon_star.png'),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '4.7',
                          style: TextStyle(
                            fontFamily: 'Sm',
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                        height: double.infinity,
                        child: CachedImage(
                            imageUrl:
                                widget.galleyProducts[selectedIndex].imgeUrl)),
                    const Spacer(),
                    Image.asset('assets/images/icon_favorite_deactive.png'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 75,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 40 - 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.galleyProducts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
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
                          padding: const EdgeInsets.all(2),
                          child: CachedImage(
                            imageUrl: widget.galleyProducts[index].imgeUrl,
                            radiuse: 10,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

/// this class for  Gallery
class GetTtitle extends StatelessWidget {
  const GetTtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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

/// ==============================================>>>>>>this class  for Color Varaint List items
class ColorVarain extends StatefulWidget {
  final List<Varaints> varaintListColor;
  const ColorVarain({super.key, required this.varaintListColor});

  @override
  State<ColorVarain> createState() => _ColorVarainState();
}

class _ColorVarainState extends State<ColorVarain> {
  List<Widget> colotWidget = [];
  @override
  void initState() {
    for (var colorVaraint in widget.varaintListColor) {
      String categoryColor = 'ff${colorVaraint.value}';
      int hexColor = int.parse(categoryColor, radix: 16);
      var items = Container(
        margin: const EdgeInsets.only(left: 10),
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: Color(hexColor),
          borderRadius: BorderRadius.circular(8),
        ),
      );

      colotWidget.add(items);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colotWidget.length,
          itemBuilder: (context, index) {
            return colotWidget[index];
          },
        ),
      ),
    );
  }
}

/// ===============================================>>>>this class  for Storge Varaint List items
class StrogeVaraint extends StatefulWidget {
  final List<Varaints> varaintListStorge;
  const StrogeVaraint({super.key, required this.varaintListStorge});

  @override
  State<StrogeVaraint> createState() => _StrogeVaraintState();
}

class _StrogeVaraintState extends State<StrogeVaraint> {
  List<Widget> strogeWidget = [];
  @override
  void initState() {
    for (var storgeVaraint in widget.varaintListStorge) {
      var items = Container(
        margin: const EdgeInsets.only(left: 10),
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
        child: Text(
          storgeVaraint.value,
          style: const TextStyle(
            fontFamily: 'Sb',
            fontSize: 12,
          ),
        ),
      );

      strogeWidget.add(items);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          itemCount: strogeWidget.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return strogeWidget[index];
          },
        ),
      ),
    );
  }
}
