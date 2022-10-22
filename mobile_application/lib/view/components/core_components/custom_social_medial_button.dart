import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
import 'custom_button.dart';
class CustomSocialMediaButton extends StatelessWidget {
  const CustomSocialMediaButton({
    required this.function,
    required this.color,
    required this.socialMediaIcon,
    required this.socialMediaName,
    Key? key,
  }) : super(key: key);
  final String socialMediaName;
  final IconData socialMediaIcon;
  final Color color;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButton(
        widget: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,
          children: [
            FaIcon(socialMediaIcon,size: 32.sp,),
            Text(
              socialMediaName,
              style: getSemiBoldStyle(
                  color: ColorManage.background,
                  height: toFigmaHeight(
                      figmaHeight: 30.sp,
                      fontSize: 20.sp),
                  fontSize: 20.sp),
            ),
          ],
        ),
        function: () {
          function();
        },
        color: color,
        disable: true,
        radius: 12.r,
      ),
    );
  }
}