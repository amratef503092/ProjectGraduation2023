import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resource/color_mananger.dart';
import '../../../../core/resource/style_manager.dart';
import '../../../components/core_components/custom_body.dart';
class UnitScreen extends StatelessWidget {
  const UnitScreen({Key? key}) : super(key: key);

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
                          "Miles / Feet",
                          style: getSemiBoldStyle(
                              color: ColorManage.primaryBlue,
                              height: 1,
                              fontSize: 24.sp),
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
                          "Kilometers / Meters",
                          style: getSemiBoldStyle(
                              color: ColorManage.secondaryBlack,
                              height: 1,
                              fontSize: 24.sp),
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
