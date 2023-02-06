import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/color_mananger.dart';
class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    required this.image,
     this.radiusOne,
     this.radiusTwo,
     this.radiusThree,
  }) : super(key: key);
  final String image ;
  final double ?radiusOne ;
  final double ?radiusTwo ;
  final double ?radiusThree ;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radiusOne ?? 50.r,
        backgroundColor: ColorManage.primaryBlue,
        child: CircleAvatar(
          radius: radiusTwo??48.r,
          backgroundColor: ColorManage.background,
          child:CircleAvatar(
            radius: radiusThree??45.r,
            backgroundColor: ColorManage.background,
            backgroundImage:  NetworkImage(image),
          ),
        )
    );
  }
}