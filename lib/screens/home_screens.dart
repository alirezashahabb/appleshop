import 'package:appleshop1/bloc/home/home_bloc.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/producs_model.dart';
import 'package:appleshop1/widgets/home/category_section.dart';
import 'package:appleshop1/widgets/home/product_itme.dart';
import 'package:appleshop1/widgets/home/slider_baneer.dart';
import 'package:appleshop1/widgets/laoding_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: _getHomeScreenContent(state, context),
          );
        },
      ),
    ));
  }
}

/// this widget for Content Home Screens
Widget _getHomeScreenContent(HomeState state, BuildContext context) {
  if (state is HomeLoadingstate) {
    return const LoadingAnimations();
  } else if (state is HomeResponceState) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(HomeInitEvent());
      },
      child: CustomScrollView(
        slivers: [
          const _GetSearchBox(),

          state.banners.fold(
            (l) => SliverToBoxAdapter(
              child: Text(l),
            ),
            (r) => _GetBannerList(r),
          ),
          const _GetCategoryTitle(),

          state.categories.fold(
            (error) => SliverToBoxAdapter(
              child: Text(error),
            ),
            (responce) => _GetCategoryList(responce),
          ),

          const _GetBestSellerTitle(),

          state.bestSllers.fold(
            (error) => SliverToBoxAdapter(
              child: Text(error),
            ),
            (r) => GetAllProducts(r),
          ),

          const _GetMostViewTitle(),

          state.hotest.fold(
            (error) => SliverToBoxAdapter(
              child: Text(error),
            ),
            (r) => GetAllProducts(r),
          ),

          // const _GetMostView(),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 20),
          ),
        ],
      ),
    );
  } else {
    return const Text('خطا محتوایی وحود ندارد');
  }
}

// class _GetMostView extends StatelessWidget {
//   const _GetMostView();

//   @override
//   Widget build(BuildContext context) {
//     return const SliverToBoxAdapter(
//       child: CategoryProducts(),
//     );
//   }
// }

class _GetMostViewTitle extends StatelessWidget {
  const _GetMostViewTitle();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(44, 32, 44, 20),
        child: Row(
          children: [
            const Text(
              'پر بازدید ترین ها',
              style: TextStyle(
                fontFamily: 'Sm',
                color: CustomColors.mainTextcolor,
                fontSize: 11,
              ),
            ),
            const Spacer(),
            const Text(
              'مشاهده همه',
              style: TextStyle(
                fontFamily: 'Sm',
                color: CustomColors.mainColor,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/images/icon_left_categroy.png'),
          ],
        ),
      ),
    );
  }
}

class GetAllProducts extends StatelessWidget {
  final List<ProdcutsList> productsList;
  const GetAllProducts(this.productsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CategoryProducts(productsList: productsList),
    );
  }
}

class _GetBestSellerTitle extends StatelessWidget {
  const _GetBestSellerTitle();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(44, 20, 44, 20),
        child: Row(
          children: [
            const Text(
              'پر فروش ترین ها',
              style: TextStyle(
                fontFamily: 'Sm',
                color: CustomColors.mainTextcolor,
                fontSize: 11,
              ),
            ),
            const Spacer(),
            const Text(
              'مشاهده همه',
              style: TextStyle(
                fontFamily: 'Sm',
                color: CustomColors.mainColor,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/images/icon_left_categroy.png'),
          ],
        ),
      ),
    );
  }
}

class _GetCategoryList extends StatelessWidget {
  final List<CategoryItems> categories;
  const _GetCategoryList(this.categories);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CategoryList(categoryList: categories),
    );
  }
}

class _GetCategoryTitle extends StatelessWidget {
  const _GetCategoryTitle();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
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
    );
  }
}

class _GetBannerList extends StatelessWidget {
  final List<BannerProducts> bannerList;
  const _GetBannerList(this.bannerList);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(banner: bannerList),
    );
  }
}

class _GetSearchBox extends StatelessWidget {
  const _GetSearchBox();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
            Image.asset('assets/images/icon_search.png'),
            const SizedBox(
              width: 16,
            ),
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
            Image.asset('assets/images/icon_apple_blue.png'),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
