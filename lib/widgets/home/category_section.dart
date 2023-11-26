import 'package:appleshop1/common/cached_image_network.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/screens/category_list_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/categoryproduct/categorybloc_bloc.dart';

/// this class for Category
class CategoryList extends StatelessWidget {
  final List<CategoryItems> categoryList;
  const CategoryList({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: categoryList.length,
        padding: const EdgeInsets.only(right: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: HorizantelItemList(categories: categoryList[index]),
          );
        },
      ),
    );
  }
}

/// this class for i tems Category
class HorizantelItemList extends StatelessWidget {
  final CategoryItems categories;
  const HorizantelItemList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${categories.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return BlocProvider<CategoryProductBloc>(
              create: (context) {
                var bloc = CategoryProductBloc();
                bloc.add(CategoryProductInitEvent(categories.id));
                return bloc;
              },
              child: ProductListScreen(
                categorie: categories,
              ),
            );
          },
        ));
      },
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  spreadRadius: -11,
                  color: Color(hexColor),
                  blurRadius: 30,
                  offset: const Offset(0, 13),
                ),
              ],
              color: Color(hexColor),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: SizedBox(
              height: 24,
              width: 24,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: CachedImage(
                    imageUrl: categories.icone,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            categories.title,
            style: const TextStyle(
              fontFamily: 'Sb',
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
