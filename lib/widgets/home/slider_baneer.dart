import 'package:appleshop1/common/color.dart';
import 'package:appleshop1/common/commone.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// this class for Baneer Slider in HomeScreens
class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            physics: defultScroll,
            itemCount: 3,
            controller: controller,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                height: 200,
                color: Colors.red,
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            effect: const ExpandingDotsEffect(
              dotHeight: 8,
              expansionFactor: 4,
              dotColor: Colors.white,
              activeDotColor: CustomColors.mainColor,
              dotWidth: 8,
            ),
            controller: controller,
            count: 3,
          ),
        )
      ],
    );
  }
}
