import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/resource/color_mananger.dart';
class CustomSmootIndicatior extends StatelessWidget {
   CustomSmootIndicatior({
    Key? key,
    required    this.index,
    required this.count,
  }) : super(key: key);
  int count;
   double index;

  @override
  Widget build(BuildContext context) {
    return SmoothIndicator(
      count: count,
      axisDirection: Axis.horizontal,
      onDotClicked: (index) {},
      effect:  const ExpandingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        dotColor: ColorManage.primaryBlue,
        activeDotColor: ColorManage.primaryBlue,
        expansionFactor: 5,
        spacing: 5,

      ), offset: index,
    );
  }
}
