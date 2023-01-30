import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_body.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManage.primaryBlue,
      body: CustomBody(
        widget: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "English",
                          style: getSemiBoldStyle(
                              color: ColorManage.primaryBlue,
                              height: 1,
                              fontSize: 24.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "English",
                          style: getRegularStyle(
                              color: ColorManage.gray,
                              height: 1,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Spacer(),
                    Checkbox(value: true
                        , onChanged: (value){

                        },

                    )
                  ],
                ),

                const Divider(
                  thickness: 1,
                  color: ColorManage.gray,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "العربية",
                          style: getSemiBoldStyle(
                              color: ColorManage.secondaryBlack,
                              height: 1,
                              fontSize: 24.sp),
                        ),
                        Text(
                          "Ar",
                          style: getRegularStyle(
                              color: ColorManage.gray,
                              height: 1,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Spacer(),
                    Checkbox(
                      value: false
                      , onChanged: (value){

                      },


                    )
                  ],
                ),

              ],
            ),
          ),
        ),
        textAppBar: 'Language',
      ),
    );
  }
}
