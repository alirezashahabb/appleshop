import 'package:appleshop1/common/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimations extends StatelessWidget {
  const LoadingAnimations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWaveSpinner(
        size: 300,
        color: CustomColors.mainColor,
      ),
    );
  }
}
