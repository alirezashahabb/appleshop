import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/widgets/home/category_products_section.dart';
import 'package:appleshop1/widgets/home/category_section.dart';
import 'package:appleshop1/widgets/home/slider_baneer.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                    'جستجو محصولات',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Sb',
                      color: CustomColors.mainTextcolor,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Image.asset('assets/images/icon_search.png'),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: BannerSlider(),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(right: 44, top: 20, bottom: 10),
            child: Text(
              'دسته بندی',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Sm',
                color: CustomColors.mainTextcolor,
                fontSize: 11,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: CategoryList(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(44, 20, 44, 20),
            child: Row(
              children: [
                Image.asset('assets/images/icon_left_categroy.png'),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'مشاهده همه',
                  style: TextStyle(
                    fontFamily: 'Sm',
                    color: CustomColors.mainColor,
                    fontSize: 11,
                  ),
                ),
                const Spacer(),
                const Text(
                  'پر فروش ترین ها',
                  style: TextStyle(
                    fontFamily: 'Sm',
                    color: CustomColors.mainTextcolor,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: CategoryProducts(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(44, 32, 44, 20),
            child: Row(
              children: [
                Image.asset('assets/images/icon_left_categroy.png'),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'مشاهده همه',
                  style: TextStyle(
                    fontFamily: 'Sm',
                    color: CustomColors.mainColor,
                    fontSize: 11,
                  ),
                ),
                const Spacer(),
                const Text(
                  'پر بازدید ترین ها',
                  style: TextStyle(
                    fontFamily: 'Sm',
                    color: CustomColors.mainTextcolor,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: CategoryProducts(),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 20))
      ],
    ));
  }
}
