import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:graduation_project/core/constatnts.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view/components/core_components/custom_text_form_faild.dart';
import 'package:graduation_project/view/pages/search_screen/search_screen.dart';
import 'package:graduation_project/view_model/bloc/activity_cubit/activity_cubit.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/resource/routes_manager.dart';
import '../../../view_model/bloc/location_cubit/location_cubit.dart';
import '../../components/core_components/custom_animation_list_view/custom_animation_list_view.dart';
import '../../components/core_components/custom_card_activity/custom_Card_activity.dart';
import '../activity_details_screen/activity_details_screen.dart';
import '../map_screen/map_screen.dart';

class HomePageScreen extends StatefulWidget
{
  HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  double padding = 24;

  List<Placemark>? address;
  TextEditingController searchController = TextEditingController();
  Future<void> getPlaceMark() async
  {
    await placemarkFromCoordinates(29.9827021, 31.2827832).then((value) {
      address = value;
      debugPrint(value[0].street);
      setState(() {

      });
    }).catchError((error) {
    });
  }
@override
  void initState() {
  getPlaceMark();

    // TODO: implement initState
  LocationCubit.get(context).getPlaceMarkCurrentLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {

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
                            "Hi".tr() + userName(),
                            style: TextStyle(
                                color: ColorManage.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        BlocConsumer<LocationCubit, LocationState>(
                          buildWhen: (previous, current) {
                            if (current is GetAddressFromLatLngCurrentSuccessful)
                            {
                              return true;
                            }
                            return false;
                          },
        listener: (context, state) {
    // TODO: implement listener
      },
          builder: (context, state) {
    return (state is GetAddressFromLatLngCurrentSuccessful)? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on_outlined,
                                color: ColorManage.primaryBlue),
                            Text(
                                "${state.address[0].name} ",

                                    style: getRegularStyle(
                                  color: ColorManage.primaryBlue,
                                  fontSize: 20.sp,
                                  height: 1),
                            )
                          ],
                        ) : const Center(child: CircularProgressIndicator());
  },
)
                      ],
                    ),
                    const Spacer(),
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
                                  controller: searchController,
                                  hint: "Explore Destination".tr(),
                                  fieldValidator: (value) {
                                    if (value!.isEmpty)
                                    {
                                      return "Please Enter Your Destination";
                                    }
                                  },
                                  onEditingComplete: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return  SearchScreen(queryText: searchController.text,);
                                    },));
                                  },
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
                  "Explore Nearby Places".tr(),
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
              OpenContainer(
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
                                                  ?.latitude ??
                                              30.033333,
                                          LocationCubit.get(context)
                                                  .position
                                                  ?.longitude ??
                                              31.00),
                                      zoom: 9,
                                    ),
                                    nonRotatedChildren: [
                                      AttributionWidget.defaultWidget(
                                        source:
                                            'OpenStreetMap contributors',
                                        onSourceTapped: null,
                                      ),
                                    ],
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName:
                                            'com.example.app',
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
                        return const MapScreen();
                      },
                    ),
              SizedBox(
                height: 20.h,
              ),
              BlocConsumer<ActivityCubit, ActivityState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  ActivityCubit cubit = ActivityCubit.get(context);
                  return SizedBox(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.activityModel?.data.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AnimationListView(
                          index: index,
                          widget: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: padding.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                OpenContainer(
                                  transitionDuration:
                                      const Duration(seconds: 1),
                                  transitionType: ContainerTransitionType.fade,
                                  closedBuilder: (context, action) =>
                                      CustomCardActivity(
                                        activityModel: cubit
                                            .activityModel!.data[index],
                                    isFavorite: cubit.activityModel!.data[index].fovourite,
                                    function: ()
                                    {
                                      action();
                                    },
                                    title: cubit.activityModel?.data[index]
                                            .activityName ??
                                        "",
                                    image: cubit
                                        .activityModel!.data[index].images[0]
                                        .toString(),
                                    functionSave: () {},
                                    location:
                                        "${LocationCubit.get(context).
                                        getLocation(cubit.activityModel!.data[index].location[0].toDouble(),
                                            cubit.activityModel!.data[index].location[1].toDouble()).toStringAsFixed(2)} ",
                                    rating: cubit
                                        .activityModel!.data[index].rate
                                        .toDouble(),
                                    review: cubit.activityModel!.data[index]
                                        .review.length
                                        .toString(),
                                    time:
                                        "${cubit.activityModel!.data[index].openTime} AM - ${cubit.activityModel!.data[index].closeTime} PM",
                                  ),
                                  openBuilder: (context, action) {
                                    return ActivityDetailsScreen(
                                      activityModel:
                                          cubit.activityModel!.data[index],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index)
                      {
                        return SizedBox(
                          height: 5.h,
                        );
                      },
                    ),
                  );
                },
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
