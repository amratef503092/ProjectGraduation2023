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
    this.subTitle = '',
    this.isBack = true,
  }) : super(key: key);
  final Widget widget;
  final String textAppBar;
  final Color colorBackGround;
  final Color colorAppBar;
  final bool isBack;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 128.h,
            color: colorAppBar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (isBack)
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: ColorManage.primaryYellow,
                          size: 36.sp,
                        ))
                    : SizedBox(
                        width: 36.w,
                      ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(textAppBar,
                        style: getSemiBoldStyle(
                            color: Colors.white, height: 0, fontSize: 28.h)),
                    Text(subTitle,
                        style: getRegularStyle(
                            color: Colors.white, height: 0, fontSize: 20.h)),
                  ],
                ),
                SizedBox(
                  width: 36.w,
                )
              ],
            ),
          ),
          Positioned(
            top: 85,
            child: Container(
              height: MediaQuery.of(context).size.height - 0.20,
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
    );
  }
}
