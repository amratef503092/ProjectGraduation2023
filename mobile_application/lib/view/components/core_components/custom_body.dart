import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
class CustomBody extends StatelessWidget {
  const CustomBody({
    Key? key,
    required this.widget,
    required this.textAppBar,
     this.colorBackGround = ColorManage.background,
    this.colorAppBar = ColorManage.primaryBlue,
    this.isBack = true,
  }) : super(key: key);
  final Widget widget;
  final String textAppBar;
  final Color colorBackGround ;
  final Color colorAppBar;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 1.sh,
        child: Stack(
          children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 128.h,
                color: colorAppBar,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (isBack)? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorManage.primaryYellow,
                    size: 36.sp,
                  )) : SizedBox(width: 36.w,),
              Center(
                  child: Text(textAppBar,
                      style: getSemiBoldStyle(
                          color: Colors.white, height: 1, fontSize: 28.h))),
              SizedBox(width: 36.w,)
            ],
          ),
            ),

            Positioned(
              top: 85,
              child: Container(
                height: MediaQuery.of(context).size.height-0.20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.r),
                      topLeft: Radius.circular(30.r),
                    ),
                    color: colorBackGround),
                child: widget,
              ),
            ),

          ],
        ),
      ),
    );
  }
}