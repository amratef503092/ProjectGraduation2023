import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_body.dart';
import 'package:graduation_project/view_model/bloc/booked-cubit/cubit/booked_cubit.dart';

import '../../../core/service_locator/service_locator.dart';
import '../../../view_model/repo/booked_activity_repo/booked_activity_repo.dart';
import '../../components/core_components/custom_button.dart';
import 'creatitCard.dart';

class MainPageBookedScreen extends StatelessWidget {
  const MainPageBookedScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => BookedCubit(sl.get<BookedActivityRepoImpl>()),
      child: BlocConsumer<BookedCubit, BookedState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          BookedCubit cubit = BookedCubit.get(context);
          return Scaffold(
            body: CustomBody(
              textAppBar: 'Fill in Details'.tr(),
              subTitle:
                  ' ${cubit.currentIndex + 1}/4: ${cubit.titles[cubit.currentIndex]}',
              widget: Column(children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 0.7.sh,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: cubit.pageController,
                    itemCount: cubit.pages.length,
                    onPageChanged: (index)
                    {
                      cubit.changeIndex(index);
                    },
                    itemBuilder: (context, index)
                    {
                      return cubit.pages[index];
                    },
                  ),
                ),
                CustomButton(
                    widget:  Text("Next".tr()),
                    function: () {
                      if (BookedCubit.get(context).paymentSelected &&
                          BookedCubit.get(context).currentIndex == 1 &&
                          BookedCubit.get(context).addCard == false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                      value: cubit,
                                      child: const MySampleState(),
                                    )));
                      } else if
                      (BookedCubit.get(context).currentIndex ==
                          BookedCubit.get(context).pages.length - 1) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.LayoutScreen, (route) => false);
                      } else {
                        cubit.next();
                      }
                    },
                    radius: 10,
                    size: Size(0.9.sw, 50.h),
                    color: ColorManage.primaryYellow)
              ]),
            ),
          );
        },
      ),
    );
  }
}
