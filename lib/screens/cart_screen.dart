import 'package:appleshop1/bloc/Cart/cart_bloc.dart';
import 'package:appleshop1/common/cached_image_network.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/common/extions_string.dart';
import 'package:appleshop1/data/model/cart_item.dart';
import 'package:appleshop1/screens/root_screens.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomScrollView(
                slivers: [
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
                          const Expanded(
                            child: Text(
                              'سبد خرید',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Sb',
                                color: CustomColors.mainColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state is CartFeatchHiveState) ...{
                    state.basketItems.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (basketItem) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => CardItems(
                            basket: basketItem[index],
                            index: index,
                          ),
                          childCount: basketItem.length,
                        ),
                      );
                    })
                  },
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 100),
                  )
                ],
              ),
              if (state is CartFeatchHiveState) ...{
                state.finalBasketPrice == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Add.png',
                            width: 300,
                            height: 300,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'سبد خرید شما خالی هست',
                            style: TextStyle(
                              fontFamily: 'Sm',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RootScreens(),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 44, vertical: 20),
                              height: 53,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: CustomColors.mainColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text(
                                'رفتن به فروشگاه',
                                style: TextStyle(
                                  fontFamily: 'Sm',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : GestureDetector(
                        onTap: () {
                          context
                              .read<CartBloc>()
                              .add(BasketPeymentInitEvent());
                          context
                              .read<CartBloc>()
                              .add(BasketPeymentRequistEvent());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 44, vertical: 20),
                          height: 53,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: CustomColors.greenColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            '${state.finalBasketPrice.formatPrice()} :پرداخت مبلغ',
                            style: const TextStyle(
                              fontFamily: 'Sm',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
              }
            ],
          );
        },
      ),
    );
  }
}

/// this class for Card Items
class CardItems extends StatelessWidget {
  final BasketItem basket;
  final int index;
  const CardItems({
    super.key,
    required this.basket,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(44, 10, 44, 60),
      height: 239,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          basket.name,
                          maxLines: 1,
                          style:
                              const TextStyle(fontFamily: 'sb', fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'گارانتی فیلان',
                          style: TextStyle(
                            fontFamily: 'sm',
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 25,
                              height: 15,
                              decoration: BoxDecoration(
                                color: CustomColors.primaryColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Text(
                                '${basket.percent!.round().toString()}%',
                                style: const TextStyle(
                                    fontFamily: 'Sm',
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'تومان',
                              style: TextStyle(fontFamily: 'sm', fontSize: 12),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              basket.price.formatPrice(),
                              style: const TextStyle(
                                  fontFamily: 'sb', fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        /// ====================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Wrap
                        Wrap(
                          spacing: 10,
                          children: [
                            const OptionCheap(
                              title: 'نارنجی',
                              color: 'FF5700',
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<CartBloc>()
                                    .add(BaskeRemoveEvent(index));
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    bottom: 2, top: 2, right: 4, left: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: CustomColors.primaryColor),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'حذف',
                                      style: TextStyle(
                                          fontFamily: 'sm',
                                          color: CustomColors.primaryColor),
                                    ),
                                    Image.asset(
                                      'assets/images/icon_trash.png',
                                      width: 12,
                                      height: 12,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                        height: 104,
                        width: 74,
                        child: CachedImage(imageUrl: basket.thumnail)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DottedLine(
              lineThickness: 2,
              dashColor: CustomColors.mainTextcolor.withOpacity(0.4),
              dashLength: 8,
              dashGapColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'تومان',
                  style: TextStyle(
                    fontFamily: 'sb',
                    fontSize: 16,
                  ),
                ),
                Text(
                  basket.realPrice.formatPrice(),
                  style: const TextStyle(
                    fontFamily: 'sb',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///------------------------------------------------>>>>>>> Option Cheap
class OptionCheap extends StatelessWidget {
  final String color;
  final String title;
  const OptionCheap({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2, top: 2, right: 4, left: 4),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CustomColors.mainTextcolor,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (color.isNotEmpty) ...{
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.paresToColor(),
              ),
            )
          },
          const SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2, top: 2, right: 4),
            child: Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontFamily: 'sm', fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
