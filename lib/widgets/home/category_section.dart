import 'package:appleshop1/common/image_loading_service.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:appleshop1/screens/category_list_screens.dart';
import 'package:flutter/material.dart';

/// this class for Category
class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoryList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: categories.length,
        padding: const EdgeInsets.only(right: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: HorizontalItemList(categories: categories[index]),
          );
        },
      ),
    );
  }
}

/// this class for items Category
class HorizontalItemList extends StatelessWidget {
  final CategoryModel categories;
  const HorizontalItemList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    ///============================================>>> convert to Color flutter
    String categoryColor = 'ff${categories.color}';
    int hex = int.parse(categoryColor, radix: 16);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryListScreens(categoryModel: categories),
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
                  color: Color(hex),
                  blurRadius: 30,
                  offset: const Offset(0, 13),
                ),
              ],
              color: Color(hex),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: SizedBox(
                width: 10,
                height: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ImageLoadingService(imageUrl: categories.icon),
                )),
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
