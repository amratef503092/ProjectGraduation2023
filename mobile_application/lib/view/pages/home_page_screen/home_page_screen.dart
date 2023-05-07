import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view/components/core_components/custom_text_form_faild.dart';
import 'package:graduation_project/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/resource/routes_manager.dart';
import '../../../view_model/bloc/location_cubit/location_cubit.dart';
import '../../components/core_components/custom_animation_list_view/custom_animation_list_view.dart';
import '../../components/core_components/custom_card_activity/custom_Card_activity.dart';
import '../../components/core_components/custom_tow_text_components/custom_two_text.dart';
import '../map_screen/map_screen.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  double padding = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 55.r,
                      backgroundColor: ColorManage.primaryBlue,
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage: const NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH6PjyUR8U-UgBWkOzFe38qcO29regN43tlGGk4sRd&s"),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hi ${AuthCubit.get(context).loginModel!.user!.name}",
                            style: TextStyle(
                                color: ColorManage.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on_outlined,
                                color: ColorManage.primaryBlue),
                            Text(
                              "Your Location Now",
                              style: getRegularStyle(
                                  color: ColorManage.primaryBlue,
                                  fontSize: 20.sp,
                                  height: 1),
                            )
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.settingScreen);
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: ColorManage.primaryBlue,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              // search bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 64.h,
                        width: 359.w,
                        decoration: BoxDecoration(
                            color: ColorManage.background,
                            border: Border.all(color: ColorManage.primaryBlue),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            const Icon(
                              Icons.add_location_alt,
                              color: ColorManage.primaryBlue,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 1.0),
                                child: CustomTextField(
                                  border: true,
                                  controller: TextEditingController(),
                                  hint: "Explore Destination",
                                  fieldValidator: (value) {},
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: ColorManage.primaryBlue,
                      child: CircleAvatar(
                        radius: 27.r,
                        backgroundColor: ColorManage.background,
                        child: const Icon(
                          Icons.search,
                          color: ColorManage.primaryBlue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Explore Nearby Places
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding.w),
                child: Text(
                  "Explore Nearby Places",
                  style: getBoldStyle(
                      color: ColorManage.primaryBlue,
                      height: 1,
                      fontSize: 28.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              SizedBox(
                height: 20.h,
              ),
              BlocConsumer<LocationCubit, LocationState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return (state is GetLocationSuccessful) ?OpenContainer(
                    closedBuilder: (context, action) {
                      return Padding(
                        padding: EdgeInsets.zero,
                        child: Stack(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 250.h,
                                child: FlutterMap(
                                  options: MapOptions(
                                    center: LatLng(
                                        LocationCubit.get(context)
                                            .position
                                            ?.latitude ??30.033333,
                                        LocationCubit.get(context)
                                            .position
                                            ?.longitude??31.00),
                                    zoom: 9,
                                  ),
                                  nonRotatedChildren: [
                                    AttributionWidget.defaultWidget(
                                      source: 'OpenStreetMap contributors',
                                      onSourceTapped: null,
                                    ),
                                  ],
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'com.example.app',
                                    ),
                                  ],
                                )),
                            Positioned(
                              bottom: 20.w,
                              left: 25.w,
                              child: Center(
                                child: CustomButton(
                                  widget: const Text(
                                    "Explore  Nearby Places",
                                  ),
                                  function: () {
                                    action();
                                  },
                                  color: ColorManage.primaryYellow,
                                  disable: true,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    openBuilder: (context, action) {
                      return MapScreen();
                    },
                  ) :
                  Center(child: CircularProgressIndicator(),);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AnimationListView(
                      index: index,
                      widget: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              title: "Go Eat & Drink",
                              function: () {},
                              titleTwo: "See All",
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 300.h,
                              child: ListView.separated(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CustomCardActivity(
                                      function: () {
                                        print("Hi");
                                      },
                                      title: "The Best Restaurant in Town",
                                      image:
                                          "https://m5.paperblog.com/i/282/2821611/nature-background-pictures-free-photo-nature--L-pUxlV9.jpeg",
                                      functionSave: () {
                                        print("hi save");
                                      },
                                      location: "1.3 km",
                                      rating: 4.5,
                                      review: "100",
                                      time: "10:00 AM - 10:00 PM",
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 30.w,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class flutterMap extends StatelessWidget {
  const flutterMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(0.0, 0.0),
        bounds: LatLngBounds(
          LatLng(51.74920, -0.56741),
          LatLng(51.25709, 0.34018),
        ),
        maxBounds: LatLngBounds(
          LatLng(-90, -180.0),
          LatLng(90.0, 180.0),
        ),
      ),
      children: [Text("Hello")],
      nonRotatedChildren: [Text("Hello")],
    );
  }
}
