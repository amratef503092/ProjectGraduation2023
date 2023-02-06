import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
class CustomBody extends StatelessWidget {
  const CustomBody({
    Key? key,
    required this.widget,
    required this.textAppBar,

  }) : super(key: key);
  final Widget widget;
  final String textAppBar;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorManage.primaryYellow,
                      size: 36.sp,
                    )),
                Center(
                    child: Text(textAppBar,
                        style: getSemiBoldStyle(
                            color: Colors.white, height: 1, fontSize: 28.h))),
                SizedBox(width: 36.w,)
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: MediaQuery.of(context).size.height-0.20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    topLeft: Radius.circular(30.r),
                  ),
                  color: Colors.white),
              child: widget,
            ),

          ],
        ),
      ),
    );
  }
}