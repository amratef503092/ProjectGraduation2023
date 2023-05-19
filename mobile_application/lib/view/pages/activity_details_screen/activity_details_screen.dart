import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/model/acitvity_model/activity_model.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view_model/bloc/activity_cubit/activity_cubit.dart';
import 'package:graduation_project/view_model/bloc/location_cubit/location_cubit.dart';
import 'package:photo_view/photo_view.dart';

import '../../../core/resource/routes_manager.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({Key? key, required this.activityModel})
      : super(key: key);
  final ActivityModel? activityModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      child: DraggableHome(
        title: Text(
          activityModel!.activityName,
          style: getBoldStyle(
              color: ColorManage.black, height: 1, fontSize: 28.sp),
        ),
        headerWidget: Stack(
          children: [
            PageView.builder(
              itemCount: activityModel!.images.length,
              itemBuilder: (context, index) {
                return PhotoView(
                  imageProvider: NetworkImage(
                    activityModel!.images[index],
                  ),
                );
              },
            ),
            Positioned(
              top: 0.05.sh,
              left: 0.05.sw,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: ColorManage.background,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorManage.primaryBlue,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.02.sh,
                ),
                // activity Name  and price
                Row(
                  children: [
                    Text(
                      activityModel!.activityName,
                      style: getBoldStyle(
                          color: ColorManage.black, height: 1, fontSize: 24),
                    ),
                    const Spacer(),
                    Text(
                      "${activityModel!.activityPrice} EGP",
                      style: getBoldStyle(
                          color: ColorManage.primaryBlue,
                          height: 1,
                          fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                // address
                BlocProvider<LocationCubit>.value(
                  value: LocationCubit.get(context)
                    ..getPlaceMark(
                      activityModel!.location[0].toDouble(),
                      activityModel!.location[1].toDouble(),
                    ),
                  child: BlocConsumer<LocationCubit, LocationState>(
                    buildWhen: (previous, current) {
                      if (current is GetAddressFromLatLngSuccessful ||
                          current is GetAddressFromLatLngError ||
                          current is GetAddressFromLatLngLoading) {
                        return true;
                      }
                      return false;
                    },
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return (state is GetAddressFromLatLngSuccessful)
                          ? Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: ColorManage.primaryBlue,
                                ),
                                Text(
                                  state.address[0].street.toString(),
                                  style: getBoldStyle(
                                      color: ColorManage.primaryBlue,
                                      height: 1,
                                      fontSize: 18.sp),
                                )
                              ],
                            )
                          : const Text("Loading...");
                    },
                  ),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                // Stars Rating
                RatingBar.builder(
                  initialRating: activityModel!.rate.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemSize: 24.sp,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: ColorManage.primaryBlue,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                Text(
                  "Description",
                  style: getSemiBoldStyle(
                      color: ColorManage.black, height: 1, fontSize: 24.sp),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
                  style: getRegularStyle(
                      color: ColorManage.black, height: 1, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 0.04.sh,
                ),
                Text(
                  "Reviews",
                  style: getSemiBoldStyle(
                      color: ColorManage.black, height: 1, fontSize: 24.sp),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                // Reviews
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: ColorManage.primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 0.05.sw,
                                    backgroundImage: NetworkImage(
                                      activityModel!
                                          .review[index].user.profileImage!,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.02.sw,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        activityModel!.review[index].user.name
                                            .toString(),
                                        style: getBoldStyle(
                                            color: ColorManage.black,
                                            height: 1,
                                            fontSize: 18.sp),
                                      ),
                                      SizedBox(
                                        height: 0.01.sh,
                                      ),
                                      RatingBar.builder(
                                        initialRating: activityModel!
                                            .review[index].rate
                                            .toDouble(),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        itemSize: 14.sp,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        ignoreGestures: true,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: ColorManage.primaryBlue,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateTime.parse(activityModel!
                                                    .review[index].created_at
                                                    .toString())
                                                .difference(DateTime.now())
                                                .inDays
                                                .toString() ==
                                            "0"
                                        ? "Today"
                                        : "${DateTime.parse(activityModel!.review[index].created_at.toString()).difference(DateTime.now()).inDays} days ago",
                                    style: getRegularStyle(
                                        color: ColorManage.black,
                                        height: 1,
                                        fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.01.sh,
                              ),
                              Text(
                                activityModel!.review[index].comment.toString(),
                                style: getRegularStyle(
                                    color: ColorManage.black,
                                    height: 1,
                                    fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 0.02.sh,
                      );
                    },
                    itemCount: activityModel!.review.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                )
              ],
            ),
          )
        ],
        physics: const BouncingScrollPhysics(),
        bottomSheet: CustomButton(
            size: Size(1.sw, 0.07.sh),
            radius: 0,
            widget: BlocConsumer<ActivityCubit, ActivityState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Row(
                  children: [
                    Text(
                      "Book Now",
                      style: getBoldStyle(
                          color: ColorManage.background,
                          height: 1,
                          fontSize: 18.sp),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          ActivityCubit.get(context).numberOfPeopleSub();
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: ColorManage.background,
                        )),
                    Text(
                      "${ActivityCubit.get(context).numberOfPeople} ",
                      style: getBoldStyle(
                          color: ColorManage.background,
                          height: 1,
                          fontSize: 18.sp),
                    ),
                    IconButton(
                        onPressed: () {
                          ActivityCubit.get(context).numberOfPeopleAdd();
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: ColorManage.background,
                        )),
                  ],
                );
              },
            ),
            function: () {
              Navigator.pushNamed(context, Routes.BookedActivityScreen,
                  arguments: activityModel);
            },
            color: ColorManage.primaryBlue),
      ),
    ));
  }
}
