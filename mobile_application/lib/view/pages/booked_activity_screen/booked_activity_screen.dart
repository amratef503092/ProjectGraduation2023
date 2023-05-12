import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/assets_manager.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/view_model/bloc/activity_cubit/activity_cubit.dart';
import 'package:graduation_project/view_model/bloc/location_cubit/location_cubit.dart';
import '../../../core/resource/style_manager.dart';
import '../../../model/acitvity_model/activity_model.dart';
import '../../components/core_components/custom_button.dart';

class BookedActivityScreen extends StatelessWidget {
  const BookedActivityScreen({
    Key? key,
    required this.activityModel,
  }) : super(key: key);
  final ActivityModel? activityModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Booked Activity',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                        activityModel!.images[0],
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
                        activityModel!.activityName,
                        style: getSemiBoldStyle(
                            color: ColorManage.primaryBlue,
                            height: 1,
                            fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Text(
                        "Price : ${activityModel!.activityPrice} EGP",
                        style: getSemiBoldStyle(
                            color: ColorManage.primaryBlue,
                            height: 1,
                            fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Text(
                        "Category : ${activityModel!.category.name}",
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
                height: 0.02.sh,
              ),
              Row(
                children: [
                  Text(
                    "How Many People :  ${ActivityCubit.get(context).numberOfPeople}",
                    style: getSemiBoldStyle(
                        color: ColorManage.primaryBlue,
                        height: 1,
                        fontSize: 18.sp),
                  ),
                  Spacer(),
                  Text(
                    "  ${ActivityCubit.get(context).numberOfPeople * activityModel!.activityPrice} EGP",
                    style: getSemiBoldStyle(
                        color: ColorManage.primaryBlue,
                        height: 1,
                        fontSize: 18.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Text(
                "Payment Method Available",
                style: getSemiBoldStyle(
                    color: ColorManage.primaryBlue, height: 1, fontSize: 24.sp),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage(AssetsManager.cashIcon),
                      ),
                      Text(
                        "Cash",
                        style: getSemiBoldStyle(
                            color: ColorManage.primaryBlue,
                            height: 1,
                            fontSize: 18.sp),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage(AssetsManager.visaIcon),
                      ),
                      Text(
                        "Visa",
                        style: getSemiBoldStyle(
                            color: ColorManage.primaryBlue,
                            height: 1,
                            fontSize: 18.sp),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: CustomButton(
          size: Size(1.sw, 0.07.sh),
          radius: 0,
          widget: Text(
            "Booked Now",
            style: getBoldStyle(
                color: ColorManage.background, height: 1, fontSize: 18.sp),
          ),
          function: () {
            ActivityCubit.get(context).activityModel2 = activityModel;
            Navigator.pushNamed(context, Routes.mainBookedDetialesScreen);
          },
          color: ColorManage.primaryBlue),
    );
  }
}
