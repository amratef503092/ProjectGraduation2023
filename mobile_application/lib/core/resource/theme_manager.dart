import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_mananger.dart';
ThemeData getTheme(){
  return ThemeData(
    scaffoldBackgroundColor: ColorManage.background,
    primaryColor: ColorManage.primaryBlue,
    // text
    textTheme: TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w800,
          fontSize: 32.sp,
           height: 0.48
      ),







    )
  );
}