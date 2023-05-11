import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/model/acitvity_model/activity_model.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view_model/bloc/location_cubit/location_cubit.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({Key? key, required this.activityModel})
      : super(key: key);
  final ActivityModel? activityModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          // SizedBox(
          //   height: 0.5.sh,
          //   width: double.infinity,
          //   child: PageView.builder(
          //     itemBuilder: (context, index) {
          //       return Image(
          //         image: NetworkImage(
          //           activityModel!.images[index],
          //         ),
          //         fit: BoxFit.cover,
          //       );
          //     },
          //     itemCount: activityModel!.images.length,
          //   ),
          // ),

          Image(
            image: NetworkImage(activityModel!.images[0]),
            fit: BoxFit.cover,
            height: 0.5.sh,
            width: double.infinity,
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
          Positioned(
            top: 0.4.sh,
            child: Container(
              height: 0.65.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                color: ColorManage.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
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
                              color: ColorManage.black,
                              height: 1,
                              fontSize: 24),
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
                          double.parse(activityModel!.location[0]),
                          double.parse(activityModel!.location[1]),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemSize: 24.sp,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: ColorManage.primaryBlue,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
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
                      height: 0.02.sh,
                    ),
                    CustomButton(
                      size: Size(1.sw, 0.07.sh),
                        widget: Text(
                          "Book Now",
                          style: getBoldStyle(
                              color: ColorManage.background,
                              height: 1,
                              fontSize: 18.sp),
                        ),
                        function: () {},
                        color: ColorManage.primaryBlue)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
