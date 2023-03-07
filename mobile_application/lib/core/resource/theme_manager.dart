import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_mananger.dart';

ThemeData getTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManage.background,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorManage.primaryBlue),

    ),
      scaffoldBackgroundColor: ColorManage.background,
      primaryColor: ColorManage.primaryBlue,
      // text
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 32.sp, height: 0.48),
      ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
