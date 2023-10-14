import 'package:appleshop1/common/color.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => const CardItems(),
                    childCount: 10),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 44),
            height: 53,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: CustomColors.greenColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'ادامه فرایند خرید',
              style: TextStyle(
                fontFamily: 'Sm',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// this class for Card Items
class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
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
                        const Text('1'),
                        const Text('1'),
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
                              child: const Text(
                                '5%',
                                style: TextStyle(
                                    fontFamily: 'Sm',
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                            const Text('تومان'),
                            const Text('45/000/000'),
                          ],
                        ),
                        const CheapOptions()
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset('assets/images/iphone.png'),
                )
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
              children: const [
                Text('تومان'),
                Text('50/000/000'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheapOptions extends StatelessWidget {
  const CheapOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CustomColors.mainTextcolor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/icon_options.png'),
          const Text('1111'),
        ],
      ),
    );
  }
}
