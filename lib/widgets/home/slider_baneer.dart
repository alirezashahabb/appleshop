import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/common/commone.dart';
import 'package:appleshop1/common/image_loading_service.dart';
import 'package:appleshop1/data/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// this class for Baneer Slider in HomeScreens
class BannerSlider extends StatelessWidget {
  final List<BannerModel> banners;
  const BannerSlider({
    super.key,
    required this.banners,
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
            physics: defaultScroll,
            itemCount: banners.length,
            controller: controller,
            itemBuilder: (context, index) {
              var items = banners[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: ImageLoadingService(
                  imageUrl: items.thumbnail,
                  radius: 15,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            effect: const ExpandingDotsEffect(
              dotHeight: 4,
              expansionFactor: 4,
              dotColor: Colors.white,
              activeDotColor: CustomColors.mainColor,
              dotWidth: 6,
            ),
            controller: controller,
            count: banners.length,
          ),
        )
      ],
    );
  }
}
