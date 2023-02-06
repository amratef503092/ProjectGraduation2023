import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/color_mananger.dart';
import '../../../../core/resource/style_manager.dart';
class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    Key? key,
    required this.title,
    required this.function,
    required this.titleTwo,
  }) : super(key: key);
  final  String title;
  final String titleTwo;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        Text(title ,
          style: getBoldStyle(color: ColorManage.black, height: 1 ,fontSize: 28.sp),
        ),
        const Spacer(),
        GestureDetector(
          onTap: (){
            function();
          },
          child: Text(titleTwo ,
            style: getRegularStyle(color: ColorManage.primaryYellow, height: 1 ,fontSize: 20.sp),
          ),
        ),
      ],
    );
  }
}