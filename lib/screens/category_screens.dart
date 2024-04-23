import 'package:appleshop1/bloc/category/categoty_bloc.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/common/image_loading_service.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreens extends StatelessWidget {
  const CategoryScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryBloc>(
      create: (context) {
        var bloc = CategoryBloc();
        bloc.add(CategoryInitEvent());
        return bloc;
      },
      child: Scaffold(
        backgroundColor: CustomColors.scaffoldColor,
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  if (state is CategoryLoadingState) ...{
                    const SliverToBoxAdapter(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: CircularProgressIndicator()),
                          ],
                        ),
                      ),
                    )
                  },
                  if (state is CategoryResponseState) ...{
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
                                'جستجو محصولات',
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
                    state.getCategory.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (r) {
                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 44),
                        sliver: CategoryItem(categoryItems: r),
                      );
                    })
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

/// this is for items category
class CategoryItem extends StatelessWidget {
  final List<CategoryModel> categoryItems;
  const CategoryItem({
    super.key,
    required this.categoryItems,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var items = categoryItems[index];
          return ImageLoadingService(imageUrl: items.thumbnail);
        },
        childCount: categoryItems.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
