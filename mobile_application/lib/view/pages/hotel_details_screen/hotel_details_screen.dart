import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view_model/bloc/hotel_cubit/cubit/hotel_cubit.dart';
import 'package:graduation_project/view_model/bloc/location_cubit/location_cubit.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
import '../../../model/hotel_model/datum.dart';
import '../../../view_model/bloc/booking_hotel_cubit/cubit/booking_hotel_cubit.dart';
import '../hotels_booking_screens/hotels_booking_screens.dart';

class HotelDetailsScreen extends StatefulWidget {
  HotelDetailsScreen({Key? key, required this.hotelModel}) : super(key: key);
  HotelModelInfo? hotelModel;

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: DefaultTabController(
              length: 3,
              animationDuration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 420.h,
                                  viewportFraction: 1,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  onPageChanged: (index, reason) {},
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                                items: List.generate(
                                    widget.hotelModel!.images!.length,
                                    (index) => Image(
                                          image: NetworkImage(widget
                                              .hotelModel!.images![index]),
                                          fit: BoxFit.fitWidth,
                                          width: double.infinity,
                                        ))),
                          ),
                          Positioned(
                            right: 10.w,
                            bottom: 10.h,
                            child: Container(
                              width: 47.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.r)),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Colors.black.withOpacity(0.45),
                                    Colors.black.withOpacity(0.42),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Text(
                                "${widget.hotelModel!.images!.length}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ScrollablePositionedList.builder(
                      //   scrollDirection: Axis.horizontal,
                      //   shrinkWrap: true,
                      //   addSemanticIndexes: true,
                      //   itemBuilder: (context, index) {
                      //     return CachedNetworkImageCustom(
                      //       height: 420.h,
                      //       width: 440.w,
                      //       boxFit: BoxFit.cover,
                      //       url:
                      //           '${widget.activitiesModel!.imagesURLs![index]}',
                      //     );
                      //   },
                      //   itemCount: widget.activitiesModel!.imagesURLs!
                      //       .length,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(20.0.sp),
                      //   child: Column(
                      //     crossAxisAlignment:
                      //         CrossAxisAlignment.start,
                      //     children: [
                      //       TextCustom(
                      //           text:
                      //               '${widget.activitiesModel!.title}',
                      //           color: ColorManager.white),
                      //       TextCustom(
                      //         //text: 'Sindbad Safari Dahab',
                      //         text:
                      //             '${widget.activitiesModel!.title}',
                      //         fontSize: 30.sp,
                      //         fontWeight: FontWeight.w600,
                      //         color: ColorManager.white,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment:
                      //             MainAxisAlignment.start,
                      //         children: [
                      //           TextCustom(
                      //             text: 'by ',
                      //             fontSize: 12.sp,
                      //             fontWeight: FontWeight.w600,
                      //             color: ColorManager.white,
                      //           ),
                      //           TextButton(
                      //               onPressed: () {
                      //                 BlocProvider.of<CompanyCubit>(
                      //                             context)
                      //                         .id = widget.activitiesModel!.company!.id;
                      //                 BlocProvider.of<CompanyCubit>(
                      //                     context)
                      //                   ..getCompanyProfile();
                      //                 navigatorPushNamed(
                      //                     context, 'companyProfile');
                      //               },
                      //               child: TextCustom(
                      //                 text:
                      //                     '${widget.activitiesModel!.company!.companyName}',
                      //                 decoration:
                      //                     TextDecoration.underline,
                      //                 textAlign: TextAlign.start,
                      //                 fontSize: 12.sp,
                      //                 fontWeight: FontWeight.w600,
                      //                 color: ColorManager.white,
                      //               )),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // favourite button
                      Positioned(
                        top: 50.h,
                        right: 20.w,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                // add the Activity to the favorite

                                // userCubit.addActivityFavourite(
                                // activityId: activitiesID,
                                // );
                              },
                              child: true
                                  ? const Center(
                                      child: Icon(
                                        Icons.bookmark_border,
                                        color: ColorManage.background,
                                      ),
                                    )
                                  : Center(
                                      child: Icon(
                                      Icons.bookmark_border,
                                      color: ColorManage.background,
                                    ))),
                        ),
                      ),
                      // share button in the activity
                      Positioned(
                        top: 120.h,
                        right: 20.w,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              // Share.share(
                              //     'check out my website https://example.com',
                              //     subject: 'Look what I made!');
                            },
                            child: const Icon(
                              Icons.share_outlined,
                              color: ColorManage.background,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 50.h,
                        left: 20.w,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              // Share.share(
                              //     'check out my website https://example.com',
                              //     subject: 'Look what I made!');
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: ColorManage.background,
                            ),
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Container(
                      //     height: 70.h,
                      //     width: 135.w,
                      //     padding: EdgeInsets.all(8.sp),
                      //     margin: EdgeInsets.all(8.sp),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(6.r),
                      //       color: Colors.white10,
                      //     ),
                      //     child: Column(
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.center,
                      //       crossAxisAlignment:
                      //           CrossAxisAlignment.start,
                      //       children: [
                      //         TextCustom(
                      //           text: 'Start From',
                      //           color: ColorManager.white,
                      //         ),
                      //         Row(
                      //           children: [
                      //             TextCustom(
                      //               text:
                      //                   '\$${widget.activitiesModel!.egyptianPrice}/',
                      //               fontSize: 20.sp,
                      //               fontWeight: FontWeight.w600,
                      //               color: ColorManager.white,
                      //             ),
                      //             TextCustom(
                      //               text: 'Person',
                      //               fontWeight: FontWeight.w600,
                      //               color: ColorManager.white,
                      //             ),
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Column(
                    children: [
                      TabBar(
                        tabs:  [
                          Tab(
                            text: "Booking".tr(),
                          ),
                          Tab(
                            text: "About".tr(),
                          ),
                          Tab(
                            text: "Reviews".tr(),
                          )
                        ],
                        labelColor: ColorManage.primaryBlue,
                        unselectedLabelColor: ColorManage.black,
                        labelStyle: getRegularStyle(
                            color: ColorManage.primaryBlue,
                            height: 1,
                            fontSize: 15.sp),
                        unselectedLabelStyle: getRegularStyle(
                            color: ColorManage.primaryBlue,
                            height: 1,
                            fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 1.sh - 300.h,
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: ListView(
                                  children: [
                                    Text(
                                      "${widget.hotelModel!.hotelName}",
                                      style: getMediumStyle(
                                          color: ColorManage.primaryBlue,
                                          fontSize: 28,
                                          height: toFigmaHeight(
                                              figmaHeight: 36.sp,
                                              fontSize: 28.sp)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: widget
                                              .hotelModel!.rate!
                                              .toDouble(),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                          itemSize: 30.sp,
                                        ),
                                        Text(
                                          "${widget.hotelModel!.reviews!.length}" + "review".tr(),
                                          style: getRegularStyle(
                                              color: ColorManage.gray,
                                              height: toFigmaHeight(
                                                  figmaHeight: 16.sp,
                                                  fontSize: 16.sp)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 20.sp,
                                          color: ColorManage.primaryBlue,
                                        ),
                                        BlocConsumer<LocationCubit,
                                            LocationState>(
                                          listener: (context, state) {},
                                          builder: (context, state) {
                                            return Text(
                                              "${LocationCubit.get(context).getLocation(widget.hotelModel!.location![0].toDouble(), widget.hotelModel!.location![1].toDouble())} " + "km from current location".tr(),
                                              style: getRegularStyle(
                                                  color: ColorManage.black,
                                                  height: toFigmaHeight(
                                                      figmaHeight: 18.sp,
                                                      fontSize: 20.sp)),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomBottomSheet(
                                            function: () {
                                              showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime.now()
                                                          .add(const Duration(
                                                              days: 365)))
                                                  .then((value) {
                                                debugPrint(
                                                    DateFormat.MMMMEEEEd()
                                                        .format(value!));
                                                setState(() {
                                                  BookingHotelCubit.get(context)
                                                      .setCheckInTime(
                                                          value.toString());
                                                });
                                              });
                                            },
                                            icon: Icons.calendar_today,
                                            text: DateFormat.MMMMEEEEd().format(
                                                DateTime.parse(
                                                    BookingHotelCubit.get(
                                                            context)
                                                        .checkInTime!)  ) ,
                                            widget: SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                    BookingHotelCubit.get(
                                                                context)
                                                            .checkInTime ??
                                                        "Check In".tr())),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                            child: BlocConsumer<
                                                BookingHotelCubit,
                                                BookingHotelState>(
                                          listener: (context, state) {},
                                          builder: (context, state) {
                                            BookingHotelCubit cubit =
                                                BookingHotelCubit.get(context);
                                            return CustomBottomSheet(
                                              function: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    content: SizedBox(
                                                      width: 200.w,
                                                      height: 300.h,
                                                      child: ListView.builder(
                                                        itemBuilder:
                                                            (context, index) {
                                                          return TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  cubit.settimeOfNight(
                                                                      "$index night(s)");
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  "$index night(s)"));
                                                        },
                                                        itemCount: 10,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: Icons.nightlight_outlined,
                                              text: cubit.timeOfNight ??
                                                  "Select Days".tr(),
                                              widget:  SizedBox(
                                                  width: double.infinity,
                                                  child: Text("Location".tr())),
                                            );
                                          },
                                        ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    // Center(
                                    //   child: Text("Check-out: Mon, 5 Otc 2020",
                                    //       style: getRegularStyle(
                                    //           fontSize: 20.sp,
                                    //           color: ColorManage.gray,
                                    //           height: 1)),
                                    // ),
                                    Row(
                                      children: [
                                        BlocConsumer<BookingHotelCubit,
                                            BookingHotelState>(
                                          listener: (context, state) {
                                            // TODO: implement listener
                                          },
                                          builder: (context, state) {
                                            BookingHotelCubit cubit =
                                                BookingHotelCubit.get(context);
                                            return Expanded(
                                              child: CustomBottomSheet(
                                                function: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: SizedBox(
                                                          width: 200.w,
                                                          height: 300.h,
                                                          child:
                                                              ListView.builder(
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      cubit.setnumberOfGuest(
                                                                          index);
                                                                      debugPrint(
                                                                          index
                                                                              .toString());
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      "$index guest(s)"));
                                                            },
                                                            itemCount: 10,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icons.family_restroom,
                                                text:
                                                    "${BookingHotelCubit.get(context).numberOfGuest} guest(s)",
                                                widget: const SizedBox(
                                                    width: double.infinity,
                                                    child: Text(
                                                        "Sun, 4 Oct 2020")),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          child: BlocConsumer<BookingHotelCubit,
                                              BookingHotelState>(
                                            listener: (context, state) {
                                              // TODO: implement listener
                                            },
                                            builder: (context, state) {
                                              BookingHotelCubit cubit =
                                                  BookingHotelCubit.get(
                                                      context);
                                              return CustomBottomSheet(
                                                function: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: SizedBox(
                                                          width: 200.w,
                                                          height: 300.h,
                                                          child:
                                                              ListView.builder(
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      cubit.setNumberOfBed(
                                                                          index);
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      "$index room(s)"));
                                                            },
                                                            itemCount: 10,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icons.bed,
                                                text:
                                                    "${BookingHotelCubit.get(context).numberOfbed} room(s)",
                                                widget: const SizedBox(
                                                    width: double.infinity,
                                                    child: Text("Location")),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    CustomButton(
                                      widget: const Text("Select Room & Book"),
                                      function: ()
                                      {
                                        if(BookingHotelCubit.get(context).timeOfNight == null)
                                          {
                                            ScaffoldMessenger.of(context).showSnackBar(const
                                            SnackBar(content: Text("Please Select Number of days") ,
                                            backgroundColor: ColorManage.redError,
                                            ));
                                            return;
                                          }
                                        Navigator.pushNamed(
                                            context, Routes.SelectRoomScreen,
                                            arguments: widget.hotelModel!.id);
                                      },
                                      color: ColorManage.primaryYellow,
                                      size: Size(366.w, 52.h),
                                    ),
                                  ],
                                ),
                              ),
                              // About
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        "About".tr(),
                                        style: getMediumStyle(
                                            color: ColorManage.primaryBlue,
                                            fontSize: 28.sp,
                                            height: toFigmaHeight(
                                                figmaHeight: 36.sp,
                                                fontSize: 28.sp)),
                                      ),
                                      SizedBox(
                                        height: 32.h,
                                      ),
                                      Text(
                                        "Description".tr(),
                                        style: getMediumStyle(
                                            color: ColorManage.secondaryBlack,
                                            fontSize: 29.sp,
                                            height: toFigmaHeight(
                                                figmaHeight: 30.sp,
                                                fontSize: 20.sp)),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      ExpandableText(
                                        "${widget.hotelModel!.description}",
                                        expandText: 'show more',
                                        collapseText: 'show less',
                                        maxLines: 5,
                                        linkColor: Colors.blue,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        "Facilities".tr(),
                                        style: getMediumStyle(
                                            color: ColorManage.secondaryBlack,
                                            fontSize: 29.sp,
                                            height: toFigmaHeight(
                                                figmaHeight: 30.sp,
                                                fontSize: 20.sp)),
                                      ),
                                      GridView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3),
                                        itemCount: 10,
                                        itemBuilder: (context, index)
                                        {
                                      return Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.wifi,
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            const Text("Free Wifi")
                                          ],
                                        ),
                                      );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            width: 20.w,
                                          );
                                        },
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: 64.w,
                                            height: 36.h,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ColorManage.nonActive),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("${index + 1}"),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  color:
                                                      ColorManage.primaryBlue,
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        itemCount: 5,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Make Review".tr(),
                                                style: getMediumStyle(
                                                    color:
                                                        ColorManage.primaryBlue,
                                                    fontSize: 20.sp,
                                                    height: toFigmaHeight(
                                                        figmaHeight: 24,
                                                        fontSize: 20.sp)),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextFormField(
                                                    maxLines: 5,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  CustomButton(
                                                      widget:  Text(
                                                          "Make Review".tr()),
                                                      function: ()
                                                      {
                                                        
                                                      },
                                                      color: ColorManage
                                                          .primaryBlue)
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: SizedBox(
                                          width: 130.w,
                                          height: 90.h,
                                          child: Card(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children:  [
                                                Text(
                                                  "Make Review".tr(),
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color:
                                                      ColorManage.primaryBlue,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          width: double.infinity,
                                          height: 150.h,
                                          child: Card(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image(
                                                        image: NetworkImage(
                                                            widget
                                                                .hotelModel!
                                                                .reviews![index]
                                                                .user!
                                                                .profileImage!),
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                          "${widget.hotelModel!.reviews![index].user!.name}")
                                                    ],
                                                  ),
                                                ),
                                                Text(widget.hotelModel!
                                                    .reviews![index].comments!),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount:
                                          widget.hotelModel!.reviews!.length,
                                    ))
                                  ],
                                ),
                              )
                            ]),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
