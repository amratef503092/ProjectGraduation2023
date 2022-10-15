import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/string_manager.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view_model/bloc/onBoarding_cubit/on_boarding_cubit.dart';
import 'package:graduation_project/view_model/bloc/onBoarding_cubit/on_boarding_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/resource/font_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding:  EdgeInsets.all(25.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                BlocConsumer<OnBoardingCubit, OnBoardingState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var cubit = OnBoardingCubit.get(context);
                    return SizedBox(
                      height: 550.h,
                      child: PageView.builder(
                        controller: controller,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                cubit.onBoardingList[index].title.tr(),
                                style: getExtraBoldStyle(
                                    color: ColorManage.primaryBlue,
                                    height: toFigmaHeight(
                                        figmaHeight: 48.sp,
                                        fontSize: FontSize.s32.sp),
                                    fontSize: FontSize.s32.sp),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                cubit.onBoardingList[index].subTitle.tr(),
                                style: getRegularStyle(
                                    color: ColorManage.secondaryBlack,
                                    height: toFigmaHeight(
                                        figmaHeight: 24.sp,
                                        fontSize: FontSize.s16.sp),
                                    fontSize: FontSize.s24.sp),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              SvgPicture.asset(
                                cubit.onBoardingList[index].imagePath,
                                width: 366.04.w,
                                height: 350.h,
                              ),
                            ],
                          );
                        },
                        onPageChanged: (index) {
                          if (kDebugMode) {
                            print(index);
                          }
                          if (index ==
                              OnBoardingCubit.get(context).onBoardingList.length -
                                  1) {
                            OnBoardingCubit.get(context).enableButtonFunction();
                          }
                          cubit.saveValue(index);
                        },
                        itemCount: cubit.onBoardingList.length,
                      ),
                    );
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<OnBoardingCubit, OnBoardingState>(
                      buildWhen: (previousState, state) {
                        if (state is SaveCurrentIndexState) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              controller.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 40.sp,
                              color: OnBoardingCubit.get(context).index > 0
                                  ? ColorManage.primaryYellow
                                  : ColorManage.variantYellow,
                            ));
                      },
                    ),
                    SmoothPageIndicator(
                        controller: controller, // PageController
                        count:
                            OnBoardingCubit.get(context).onBoardingList.length,
                        effect: const CustomizableEffect(
                            dotDecoration: DotDecoration(
                                width: 16,
                                height: 4,
                                color: ColorManage.variantBlue2,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            activeDotDecoration: DotDecoration(
                                width: 16,
                                color: ColorManage.primaryBlue,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    5)))), // your preferred effect
                        onDotClicked: (index) {}),
                    BlocBuilder<OnBoardingCubit, OnBoardingState>(
                      buildWhen: (previousState, state) {
                        if (state is SaveCurrentIndexState) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 40.sp,
                              color: OnBoardingCubit.get(context).index >= 0 &&
                                      OnBoardingCubit.get(context).index != 3
                                  ? ColorManage.primaryYellow
                                  : ColorManage.variantYellow,
                            ));
                      },
                    ),
                  ],
                ),
                BlocBuilder<OnBoardingCubit, OnBoardingState>(
                  buildWhen: (previousState, state) {
                    if (state is EnableButtonState) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManage.primaryYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r)
                        ),
                        fixedSize: Size(366.w, 64.h),
                      ),
                        onPressed: OnBoardingCubit.get(context).enableButton
                            ? () {}
                            : null,
                        child: Text(StringManager.getStart.tr() ,style: getSemiBoldStyle(color:
                            ColorManage.background,
                            fontSize: 20.sp,
                            height: toFigmaHeight(fontSize: 20.sp,figmaHeight: 20.sp)),));
                  },
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      context.setLocale(const Locale('ar'));
                    }, child: const Text("ar")),
                    ElevatedButton(onPressed: (){
                      context.setLocale(const Locale('en'));
                    }, child: const Text("en")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
