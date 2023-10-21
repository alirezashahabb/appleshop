import 'package:appleshop1/common/cached_image_network.dart';
import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/common/commone.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// this class for banner Slider in HomeScreens
class BannerSlider extends StatelessWidget {
  final List<BannerProducts> banner;
  const BannerSlider({
    super.key,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.9);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 177,
          child: PageView.builder(
            physics: defultScroll,
            itemCount: 3,
            controller: controller,
            itemBuilder: (context, index) {
              var items = banner[index];
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  child: CachedImage(
                    imageUrl: items.image,
                    radiuse: 15,
                  ));
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            effect: const ExpandingDotsEffect(
              dotHeight: 5,
              expansionFactor: 4,
              dotColor: Colors.white,
              activeDotColor: CustomColors.mainColor,
              dotWidth: 5,
            ),
            controller: controller,
            count: 3,
          ),
        )
      ],
    );
  }
}
