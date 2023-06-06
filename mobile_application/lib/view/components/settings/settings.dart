import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';

import '../text/text_custom.dart';

Widget settingItem({required String lable, Function? onPressed,required BuildContext context}) {
  return InkWell(
    onTap: () {
      onPressed == null ? null : onPressed();
    },
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child:TextCustom(text:
            lable,
              fontSize: 24.sp,
              color: ColorManage.primaryBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: ColorManage.primaryBlue,
          ),
        ],
      ),
    ),
  );

}
