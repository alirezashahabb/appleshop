import 'dart:ui';

import 'package:appleshop1/bloc/product/bloc/product_bloc.dart';
import 'package:appleshop1/common/cached_image_network.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/data/model/gallery.dart';
import 'package:appleshop1/data/model/product_varaint.dart';
import 'package:appleshop1/data/model/propreties.dart';
import 'package:appleshop1/data/model/variant_type.dart';
import 'package:appleshop1/data/model/varint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/producs_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProdcutsList products;
  const ProductDetailScreen({
    super.key,
    required this.products,
  });

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
                if (state is ProductResponseState) ...{
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
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
                          Expanded(
                              child: state.categories.fold((error) {
                            return const Text(
                              'دسته بندی',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Sb',
                                color: CustomColors.mainColor,
                                fontSize: 16,
                              ),
                            );
                          }, (categoryName) {
                            return Text(
                              categoryName.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Sb',
                                color: CustomColors.mainColor,
                                fontSize: 16,
                              ),
                            );
                          })),
                          Image.asset('assets/images/icon_back.png'),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                },

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      products.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                      thumbnailImage: products.thumnail,
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
                    (productVaraintList) => VaraintContinerGenerator(
                        productList: productVaraintList),
                  )
                },

                //=======================================>>>>>> Technical Specifications
                if (state is ProductResponseState) ...{
                  state.propertis.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (propertis) {
                    return ProductPropertis(
                      properties: propertis,
                    );
                  })
                },
                //=======================================>>>>>> About Products
                ProductAbout(descreption: products.descreption),
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

//=======================================>>>>>> Technical Specifications
class ProductPropertis extends StatefulWidget {
  final List<Properties> properties;
  const ProductPropertis({
    super.key,
    required this.properties,
  });

  @override
  State<ProductPropertis> createState() => _ProductPropertisState();
}

class _ProductPropertisState extends State<ProductPropertis> {
  bool isvisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isvisible = !isvisible;
                });
              },
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
            const SizedBox(
              height: 5,
            ),
            Visibility(
              visible: isvisible,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: CustomColors.mainTextcolor,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.properties.length,
                  itemBuilder: (context, index) {
                    var property = widget.properties[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            '${property.value} :  ${property.title}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontFamily: 'sm',
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//=======================================>>>>>>  Products About
class ProductAbout extends StatefulWidget {
  final String descreption;
  const ProductAbout({
    super.key,
    required this.descreption,
  });

  @override
  State<ProductAbout> createState() => _ProductAboutState();
}

class _ProductAboutState extends State<ProductAbout> {
  bool _isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isVisibility = !_isVisibility;
                });
              },
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
            const SizedBox(
              height: 8,
            ),
            Visibility(
              visible: _isVisibility,
              child: Container(
                alignment: Alignment.center,
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
                    padding: const EdgeInsets.all(9),
                    child: Text(
                      widget.descreption,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontFamily: 'Sb',
                        fontSize: 14,
                        height: 1.5,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ==========================================================>>>>>this class for Color Varaint For Prodducts
class VaraintContinerGenerator extends StatelessWidget {
  final List<ProdductVaraint> productList;
  const VaraintContinerGenerator({
    super.key,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        for (var produvtVaraints in productList) ...{
          if (produvtVaraints.variltList.isNotEmpty) ...{
            VaraintChid(
              prodductVaraint: produvtVaraints,
            )
          }
        }
      ],
    ));
  }
}

class VaraintChid extends StatelessWidget {
  final ProdductVaraint prodductVaraint;
  const VaraintChid({super.key, required this.prodductVaraint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            prodductVaraint.variantType.title,
            style: const TextStyle(
              fontFamily: 'Sb',
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (prodductVaraint.variantType.type == VariantTypeEnum.STORAGE) ...{
            StrogeVaraint(varaintListStorge: prodductVaraint.variltList)
          },
          if (prodductVaraint.variantType.type == VariantTypeEnum.COLOR) ...{
            ColorVarain(varaintListColor: prodductVaraint.variltList)
          }
        ],
      ),
    );
  }
}

/// this class for galley
class GetGalley extends StatefulWidget {
  final List<ProductGallery> galleyProducts;
  final String thumbnailImage;

  const GetGalley({
    super.key,
    required this.galleyProducts,
    required this.thumbnailImage,
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
                        height: 200,
                        width: 200,
                        child: CachedImage(
                            // cheack for image
                            imageUrl: (widget.galleyProducts.isEmpty)
                                ? widget.thumbnailImage
                                : widget
                                    .galleyProducts[selectedIndex].imgeUrl)),
                    const Spacer(),
                    Image.asset('assets/images/icon_favorite_deactive.png'),
                  ],
                ),
              ),
            ),

            /// cheack image gallery
            if (widget.galleyProducts.isNotEmpty) ...{
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
            },
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
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.varaintListColor.length,
          itemBuilder: (context, index) {
            String categoryColor = 'ff${widget.varaintListColor[index].value}';
            int hexColor = int.parse(categoryColor, radix: 16);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  border: (selectedIndex == index)
                      ? Border.all(
                          width: 6,
                          color: Colors.white,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        )
                      : Border.all(
                          width: 2,
                          color: Colors.white,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                  color: Color(hexColor),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
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
  int selecetedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          itemCount: widget.varaintListStorge.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selecetedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                width: 74,
                height: 26,
                decoration: BoxDecoration(
                  border: (selecetedIndex == index)
                      ? Border.all(
                          width: 1,
                          color: CustomColors.mainColor,
                        )
                      : Border.all(
                          width: 1,
                          color: CustomColors.mainTextcolor,
                        ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.varaintListStorge[index].value,
                  style: const TextStyle(
                    fontFamily: 'Sb',
                    fontSize: 12,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
