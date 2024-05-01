import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/data/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryListScreens extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryListScreens({super.key, required this.categoryModel});

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
                    Expanded(
                      child: Text(
                        categoryModel.title,
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
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => const Text('')),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.6,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
