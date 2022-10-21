import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resource/assets_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManage.primaryBlue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 28.0.h),
                child: SizedBox(
                  height: 96.h,
                  child: Text(
                    "Welcome To Travel X",
                    style: getBoldStyle(color: Colors.white, height: toFigmaHeight(figmaHeight: 48.sp, fontSize: 32.sp),fontSize:32.sp ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                  height: 320.h,
                  child: Lottie.asset(AssetsManager.lottieHomePage)),
              Container(
                height: 350.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  color: Colors.white
                ),
              )
            ],
          )),
    );
  }
}
