import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/core/resource/string_manager.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resource/assets_manager.dart';
import '../../components/core_components/custom_social_medial_button.dart';

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
                padding: EdgeInsets.only(top: 28.0.h),
                child: SizedBox(
                  height: 96.h,
                  width: 200.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    StringManager.welcome.tr(),
                    style: getBoldStyle(
                        color: Colors.white,
                        height:
                            toFigmaHeight(figmaHeight: 48.sp, fontSize: 32.sp),
                        fontSize: 32.sp),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 350.h,
                    child: Lottie.asset(AssetsManager.lottieHomePage)),
              ),
              Expanded(
                child: Container(
                  height: 400.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r),
                      topRight: Radius.circular(32.r),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // facebook and google button
                        Row(
                          children: [
                            CustomSocialMediaButton(
                              function: () {},
                              color: const Color(0xff3B5998),
                              socialMediaIcon: FontAwesomeIcons.facebook,
                              socialMediaName: 'FaceBook',
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            CustomSocialMediaButton(
                              function: () {
                                context.setLocale(const Locale('en'));
                              },
                              color: const Color(0xffDD4B39),
                              socialMediaIcon: FontAwesomeIcons.googlePlus,
                              socialMediaName: 'Google',
                            ),
                          ],
                        ),
                        CustomButton(
                          widget: Text(StringManager.signIn.tr(),
                              style: getBoldStyle(
                                  color: ColorManage.background,
                                  height: toFigmaHeight(
                                      figmaHeight: 30.sp, fontSize: 20.sp),
                                  fontSize: 20.sp)),
                          function: () {
                            Navigator.pushNamed(context, Routes.signIn);
                          },
                          color: ColorManage.primaryYellow,
                          disable: true,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                height: 50,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(StringManager.or.tr(),
                                  style: getExtraBoldStyle(
                                      color: ColorManage.gray,
                                      height: toFigmaHeight(
                                          figmaHeight: 24.sp, fontSize: 16.sp),
                                      fontSize: 16.sp)),
                            ),
                            const Expanded(
                              child: Divider(
                                height: 50,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(MediaQuery.of(context).size.width, 64.h),

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r)),
                              side: const BorderSide(color: ColorManage.primaryYellow)),
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signUp);
                          },
                          child:  Text(StringManager.signUp.tr() ,style: getExtraBoldStyle(color: ColorManage.primaryYellow
                              , height: toFigmaHeight(figmaHeight: 30.sp, fontSize: 20.sp),fontSize: 20.sp),),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
