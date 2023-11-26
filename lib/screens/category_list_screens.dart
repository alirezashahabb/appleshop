import 'package:appleshop1/bloc/categoryproduct/categorybloc_bloc.dart';
import 'package:appleshop1/common/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/category_model.dart';
import '../widgets/home/category_products_section.dart';

class ProductListScreen extends StatelessWidget {
  final CategoryItems categorie;
  const ProductListScreen({super.key, required this.categorie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryProductBloc, CategoryProductState>(
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
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
                        Expanded(
                          child: Text(
                            categorie.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                if (state is CategoryProductResponceState) ...{
                  state.categoreis.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (productList) {
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => ProductsItems(
                            products: productList[index],
                          ),
                          childCount: productList.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.6,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                      ),
                    );
                  })
                }
              ],
            ),
          );
        },
      ),
    );
  }
}
