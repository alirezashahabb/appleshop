import 'package:appleshop1/bloc/bloc/category_bloc.dart';
import 'package:appleshop1/common/cached_image_network.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreens extends StatelessWidget {
  const CategoryScreens({super.key});

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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const SliverToBoxAdapter(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryResponce) {
                  return state.response.fold(
                      (l) => SliverToBoxAdapter(
                            child: Text(l),
                          ),
                      (r) => CategoryList(
                            listItems: r,
                          ));
                } else {
                  return const SliverToBoxAdapter(
                    child: Text('state not support'),
                  );
                }
              },
            ),

            // const CategoryList()
          ],
        ),
      ),
    );
  }
}

/// this class for category Items
class CategoryList extends StatelessWidget {
  final List<CategoryItems> listItems;
  const CategoryList({
    super.key,
    required this.listItems,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            var items = listItems[index];
            return CachedImage(imageUrl: items.images);
          },
          childCount: listItems.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
