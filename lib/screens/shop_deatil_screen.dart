import 'dart:ui';

import 'package:appleshop1/bloc/product/product_bloc.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/common/image_loading_service.dart';
import 'package:appleshop1/data/model/galley_model.dart';
import 'package:appleshop1/data/model/product_model.dart';
import 'package:appleshop1/data/model/product_varaint_model.dart';
import 'package:appleshop1/data/model/propert_model.dart';
import 'package:appleshop1/data/model/varaint.dart';
import 'package:appleshop1/data/model/variant_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetailScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = ProductBloc();
        bloc.add(ProductInitEvent(
            productId: productModel.id, categoryId: productModel.categoryId));
        return bloc;
      },
      child: Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  if (state is ProductLoadingSate) ...{
                    const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  } else if (state is ProductResponseState) ...{
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
                                child: state.productCategory.fold((error) {
                              return const Text(
                                'دسته بندی',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Sb',
                                  color: CustomColors.mainColor,
                                  fontSize: 16,
                                ),
                              );
                            }, (categoryProduct) {
                              return Text(
                                categoryProduct.title,
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
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          productModel.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Sb',
                          ),
                        ),
                      ),
                    ),
                    ///////////////////////////// this is for gallery section
                    state.productGallery.fold(
                      (error) {
                        return SliverToBoxAdapter(
                          child: Text(error),
                        );
                      },
                      ((galleyItems) {
                        return GalleryWidget(
                          galleryItems: galleyItems,
                          productModel.thumbnail,
                        );
                      }),
                    ),
                    //================================================>>>>>>  Color Variant

                    state.productVariant.fold(
                      (error) {
                        return SliverToBoxAdapter(
                          child: Text(error),
                        );
                      },
                      (variantList) {
                        return VariantContainerGenerator(
                            variantList: variantList);
                      },
                    ),

                    //=======================================>>>>>> Technical Specifications
                    state.productProperty.fold(
                      (error) {
                        return SliverToBoxAdapter(
                          child: Text(error),
                        );
                      },
                      (propertyList) {
                        return TechnicalProduct(
                          property: propertyList,
                        );
                      },
                    ),
                    //=======================================>>>>>> About Products
                    ProductDescription(description: productModel.description),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'نظر کاربران ',
                                  style: TextStyle(
                                    fontFamily: 'Sb',
                                    fontSize: 12,
                                  ),
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    Positioned(
                                      right: 15,
                                      child: Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ShopDetails(), AddBasket()],
                        ),
                      ),
                    )
                  }
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// this class  for Technical Specifications products
class TechnicalProduct extends StatefulWidget {
  final List<PropertyModel> property;
  const TechnicalProduct({
    super.key,
    required this.property,
  });

  @override
  State<TechnicalProduct> createState() => _TechnicalProductState();
}

class _TechnicalProductState extends State<TechnicalProduct> {
  bool isVisiblity = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 15),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isVisiblity = !isVisiblity;
            });
          },
          child: Column(
            children: [
              Container(
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
                      const Text(
                        'مشخصات فنی',
                        style: TextStyle(
                          fontFamily: 'Sb',
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'مشاهده',
                        style: TextStyle(
                          fontFamily: 'Sb',
                          fontSize: 14,
                          color: CustomColors.mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/images/icon_left_categroy.png'),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isVisiblity,
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: CustomColors.mainTextcolor,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: widget.property.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.property.length,
                          itemBuilder: (context, index) {
                            var propert = widget.property[index];
                            return Row(
                              children: [
                                Flexible(
                                    child: Text(
                                        '${propert.title} : ${propert.value} ')),
                              ],
                            );
                          },
                        )
                      : const Text('برای این محصول هیج مشخصه ای ثبت  نشده'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// this class for Product Description
class ProductDescription extends StatefulWidget {
  final String description;
  const ProductDescription({
    super.key,
    required this.description,
  });

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isVisiblity = false;
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
                  isVisiblity = !isVisiblity;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
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
                      const Text(
                        'توضیحات محصول',
                        style: TextStyle(
                          fontFamily: 'Sb',
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'مشاهده',
                        style: TextStyle(
                          fontFamily: 'Sb',
                          fontSize: 14,
                          color: CustomColors.mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/images/icon_left_categroy.png'),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisiblity,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: CustomColors.mainTextcolor,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontFamily: 'Sm',
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// this class for Storage Variant
class StorageVariant extends StatelessWidget {
  final List<ProductVariantModel> variantList;
  const StorageVariant({
    super.key,
    required this.variantList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              variantList[1].variantTypeModel.title,
              style: const TextStyle(
                fontFamily: 'Sb',
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StorageVariantItems(
              variantList: variantList[1].variant,
            )
          ],
        ),
      ),
    );
  }
}

//this class for  Color Variant option in detail screen
class VariantContainerGenerator extends StatelessWidget {
  final List<ProductVariantModel> variantList;
  const VariantContainerGenerator({
    super.key,
    required this.variantList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        for (var variantItem in variantList) ...{
          if (variantItem.variant.isNotEmpty) ...{
            VariantGeneratorChild(
              productVariantModel: variantItem,
            )
          }
        }
      ],
    ));
  }
}

/// this class for Variant Generator Chid example Variant Color and Variant Storage
class VariantGeneratorChild extends StatelessWidget {
  final ProductVariantModel productVariantModel;
  const VariantGeneratorChild({super.key, required this.productVariantModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productVariantModel.variantTypeModel.title,
            style: const TextStyle(
              fontFamily: 'Sb',
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (productVariantModel.variantTypeModel.type ==
              VariantTypeEnum.Color) ...{
            ColorVariantItems(
              variantList: productVariantModel.variant,
            )
          },
          if (productVariantModel.variantTypeModel.type ==
              VariantTypeEnum.Storage) ...{
            StorageVariantItems(
              variantList: productVariantModel.variant,
            )
          }
        ],
      ),
    );
  }
}

///////////////////////////// this is for gallery section
class GalleryWidget extends StatefulWidget {
  final List<GalleryModel> galleryItems;
  String? defaultImage;
  GalleryWidget(
    this.defaultImage, {
    super.key,
    required this.galleryItems,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  int _selectedIndex = 0;
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
                      height: 150,
                      width: 150,
                      child: ImageLoadingService(
                          imageUrl: (widget.galleryItems.isNotEmpty)
                              ? widget.galleryItems[_selectedIndex].image
                              : widget.defaultImage ?? ''),
                    ),
                    const Spacer(),
                    Image.asset('assets/images/icon_favorite_deactive.png'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            if (widget.galleryItems.isNotEmpty) ...{
              SizedBox(
                height: 75,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 40 - 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.galleryItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(8),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: CustomColors.mainTextcolor,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ImageLoadingService(
                              imageUrl: widget.galleryItems[index].image)),
                    );
                  },
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

/// this class for items Variant Colors
class ColorVariantItems extends StatefulWidget {
  final List<VariantModel> variantList;

  const ColorVariantItems({super.key, required this.variantList});

  @override
  State<ColorVariantItems> createState() => _ColorVariantItemsState();
}

class _ColorVariantItemsState extends State<ColorVariantItems> {
  int _slecetedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.variantList.length,
          itemBuilder: (context, index) {
            String categoryColor = 'ff${widget.variantList[index].value}';
            int hexColor = int.parse(categoryColor, radix: 16);
            return GestureDetector(
              onTap: () {
                setState(() {
                  _slecetedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Color(hexColor),
                  border: (_slecetedIndex == index)
                      ? Border.all(
                          width: 5,
                          color: Color(hexColor),
                          strokeAlign: BorderSide.strokeAlignOutside)
                      : Border.all(
                          width: 2,
                          color: Colors.white,
                          strokeAlign: BorderSide.strokeAlignOutside),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }),
    );
  }
}

/// this class for StorageVariant Items
class StorageVariantItems extends StatefulWidget {
  final List<VariantModel> variantList;
  const StorageVariantItems({super.key, required this.variantList});

  @override
  State<StorageVariantItems> createState() => _StorageVariantItemsState();
}

class _StorageVariantItemsState extends State<StorageVariantItems> {
  List<Widget> storageWidget = [];
  @override
  void initState() {
    for (var colorVariant in widget.variantList) {
      var item = Container(
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
          colorVariant.value,
          style: const TextStyle(
            fontFamily: 'Sb',
            fontSize: 12,
          ),
        ),
      );
      storageWidget.add(item);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: storageWidget.length,
          itemBuilder: (context, index) => storageWidget[index]),
    );
  }
}
