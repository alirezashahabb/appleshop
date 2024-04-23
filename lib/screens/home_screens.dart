import 'package:appleshop1/bloc/home/home_bloc.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/data/model/product_model.dart';
import 'package:appleshop1/widgets/home/category_section.dart';
import 'package:appleshop1/widgets/home/product_item.dart';
import 'package:appleshop1/widgets/home/slider_baneer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) {
        var bloc = HomeBloc();
        bloc.add(HomeInitEvent());
        return bloc;
      },
      child: Scaffold(body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is HomeLoadingState) ...{
                const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              },
              if (state is HomeResponseState) ...{
                // search box
                const _GetSearchBox(),
                // banner list
                state.banners.fold((error) {
                  return SliverToBoxAdapter(
                    child: Text(error),
                  );
                }, (bannersList) {
                  return _GetBanner(banners: bannersList);
                }),
                // category title
                const _GatCategoryTitle(),
                state.categories.fold((error) {
                  return SliverToBoxAdapter(
                    child: Text(error),
                  );
                }, (categories) {
                  return _GatCategory(
                    categories: categories,
                  );
                }),
                // product title
                const _GetBestSellerTitle(),
                // product list
                state.bestSeller.fold(
                  (error) {
                    return SliverToBoxAdapter(
                      child: Text(error),
                    );
                  },
                  (products) {
                    return _GetBastSeller(
                      products: products,
                    );
                  },
                ),
                const _GetMostViewTitle(),
                state.hottest.fold((error) {
                  return SliverToBoxAdapter(
                    child: Text(error),
                  );
                }, (hottestProductList) {
                  return _GetMostView(
                    products: hottestProductList,
                  );
                })
              },
            ],
          );
        },
      )),
    );
  }
}

class _GetMostView extends StatelessWidget {
  final List<ProductModel> products;
  const _GetMostView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CategoryProducts(products: products),
    );
  }
}

class _GetMostViewTitle extends StatelessWidget {
  const _GetMostViewTitle({
    super.key,
  });

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

class _GetBastSeller extends StatelessWidget {
  final List<ProductModel> products;
  const _GetBastSeller({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CategoryProducts(products: products),
    );
  }
}

class _GetBestSellerTitle extends StatelessWidget {
  const _GetBestSellerTitle({
    super.key,
  });

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

class _GatCategory extends StatelessWidget {
  final List<CategoryModel> categories;
  const _GatCategory({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CategoryList(categories: categories),
    );
  }
}

class _GatCategoryTitle extends StatelessWidget {
  const _GatCategoryTitle({
    super.key,
  });

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

/// this class fetch banner to api
class _GetBanner extends StatelessWidget {
  final List<BannerModel> banners;
  const _GetBanner({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(banners: banners),
    );
  }
}

class _GetSearchBox extends StatelessWidget {
  const _GetSearchBox({
    super.key,
  });

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
