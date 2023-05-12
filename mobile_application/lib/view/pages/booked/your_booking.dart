import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view_model/bloc/activity_cubit/activity_cubit.dart';

import '../../../view_model/bloc/location_cubit/location_cubit.dart';

class YourBookingScreen extends StatelessWidget {
  const YourBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sh),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Your Booking',
            style: getSemiBoldStyle(
                color: ColorManage.primaryBlue, height: 1, fontSize: 20),
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: ColorManage.primaryBlue,
                      width: 2,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    ActivityCubit.get(context).activityModel2!.images[0],
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ActivityCubit.get(context).activityModel2!.activityName,
                    style: getSemiBoldStyle(
                        color: ColorManage.primaryBlue,
                        height: 1,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                  Text(
                    "Price : ${ActivityCubit.get(context).activityModel2!.activityPrice} EGP",
                    style: getSemiBoldStyle(
                        color: ColorManage.primaryBlue,
                        height: 1,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                  Text(
                    "Category : ${ActivityCubit.get(context).activityModel2!.category.name}",
                    style: getSemiBoldStyle(
                        color: ColorManage.primaryBlue,
                        height: 1,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                  Text(
                    LocationCubit.get(context).address![0].name!,
                    style: getSemiBoldStyle(
                        color: ColorManage.primaryBlue,
                        height: 1,
                        fontSize: 18.sp),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 0.04.sh,
          ),
          Row(
            children: [
              Text(
                ' people  ',
                style: getSemiBoldStyle(
                    color: ColorManage.primaryBlue, height: 1, fontSize: 20),
              ),
              const Spacer(),
              Text(
                '${ActivityCubit.get(context).numberOfPeople} * ${ActivityCubit.get(context).activityModel2!.activityPrice} EGP',
                style: getSemiBoldStyle(
                    color: ColorManage.primaryBlue, height: 1, fontSize: 20),
              ),
            ],
          ),
          const Divider(
            color: ColorManage.primaryBlue,
            thickness: 2,
          ),
          Row(
            children: [
              Text(
                ' Total  ',
                style: getSemiBoldStyle(
                    color: ColorManage.primaryBlue, height: 1, fontSize: 20),
              ),
              const Spacer(),
              Text(
                '${ActivityCubit.get(context).numberOfPeople * ActivityCubit.get(context).activityModel2!.activityPrice} EGP',
                style: getSemiBoldStyle(
                    color: ColorManage.primaryBlue, height: 1, fontSize: 20),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
