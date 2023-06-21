import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constatnts.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view/pages/hotels_booking_screens/hotels_booking_screens.dart';
import 'package:graduation_project/view_model/bloc/booking_hotel_cubit/cubit/booking_hotel_cubit.dart';

import '../../../core/resource/assets_manager.dart';
import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
import '../../../model/room_model/room_model/datum.dart';
import '../booking_successfuly_screen/booking_successfuly_screen.dart';

class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({
    Key? key,
    required this.roomModelInfo,
  }) : super(key: key);
  final RoomModelInfo roomModelInfo;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingHotelCubit, BookingHotelState>(
      listener: (context, state)
      {
        if(state is BookingRoomSuccessfullyState)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BookedSuccessfulyScreen()));
        }
        // TODO: implement
      },
      builder: (context, state)
      {
        return Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
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
                              roomModelInfo.images!.length,
                              (index) => Image(
                                    image: NetworkImage(
                                      roomModelInfo.images![index],
                                    ),
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
                          borderRadius: BorderRadius.all(Radius.circular(3.r)),
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
                          "${1}",
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
            Padding(
              padding: EdgeInsets.all(24.0.sp),
              child: Column(
                children: [
                  // Text(
                  //   "Deluxe Room, 1 King Bed",
                  //   style: getBoldStyle(
                  //       color: ColorManage.primaryBlue,
                  //       fontSize: 28.sp,
                  //       height:
                  //           toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AssetsManager.peopleIcon),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("1 guest(s)"),
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset(AssetsManager.bedIcon),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("2 Twin bed"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(roomModelInfo.descripions!),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Check In".tr(),
                  style: getBoldStyle(
                      color: ColorManage.primaryBlue,
                      fontSize: 28.sp,
                      height:
                          toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(DateTime.parse(
                      BookingHotelCubit.get(context).checkInTime!)),
                  style: getBoldStyle(
                      color: ColorManage.primaryBlue,
                      fontSize: 18.sp,
                      height:
                          toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Check Out".tr(),
                  style: getBoldStyle(
                      color: ColorManage.primaryBlue,
                      fontSize: 28.sp,
                      height:
                          toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(DateTime.parse(
                          BookingHotelCubit.get(context).checkInTime!)
                      .add(Duration(
                          days: int.parse(BookingHotelCubit.get(context)
                              .timeOfNight![0])))),
                  style: getBoldStyle(
                      color: ColorManage.primaryBlue,
                      fontSize: 18.sp,
                      height:
                          toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Number of Days",
                  style: getBoldStyle(
                      color: ColorManage.primaryBlue,
                      fontSize: 28.sp,
                      height:
                          toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
                ),
                Text(
                  "${BookingHotelCubit.get(context).timeOfNight![0]} Days",
                  style: getBoldStyle(
                      color: ColorManage.primaryBlue,
                      fontSize: 18.sp,
                      height:
                          toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Total Price",
            //       style: getBoldStyle(
            //           color: ColorManage.primaryBlue,
            //           fontSize: 28.sp,
            //           height:
            //               toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
            //     ),
            //     Text(
            //       "${int.parse(BookingHotelCubit.get(context).timeOfNight![0]) * roomModelInfo.priceperDay!} EGP",
            //       style: getBoldStyle(
            //           color: ColorManage.primaryBlue,
            //           fontSize: 18.sp,
            //           height:
            //               toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
            //     ),
            //   ],
            // ),
          ])),
          bottomSheet: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: ColorManage.variantBlue1)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "${int.parse(BookingHotelCubit.get(context).timeOfNight![0]) * double.parse( roomModelInfo.priceperDay!)} EGP",
                        style: getBoldStyle(
                            color: ColorManage.redError,
                            height: toFigmaHeight(
                                figmaHeight: 26, fontSize: 30.sp)),
                      ),
                      const Spacer(),
                      CustomButton(
                        color: ColorManage.primaryYellow,
                          size: Size(100.w, 40.h),
                          function: () async {
                            print("Amr");
                            print(getUserID());
                            Map<String, dynamic> data = {
                              "hotel_info_id": roomModelInfo.hotelInfo!.id,
                              "user_id": getUserID(),
                              "room_id": roomModelInfo.id,
                              "num_of_nights": BookingHotelCubit.get(context)
                                  .timeOfNight![0],
                              "num_of_guests":
                                  BookingHotelCubit.get(context).numberOfGuest,
                              "total_price": int.parse(
                                      BookingHotelCubit.get(context)
                                          .timeOfNight![0]) *
                                  double.parse(roomModelInfo.priceperDay!),
                              "check_in":
                                  BookingHotelCubit.get(context).checkInTime,
                              "check_out": DateTime.parse(
                                      BookingHotelCubit.get(context)
                                          .checkInTime!)
                                  .add(Duration(
                                      days: int.parse(
                                          BookingHotelCubit.get(context)
                                              .timeOfNight![0])))
                                  .toString()
                            };
                            await BookingHotelCubit.get(context)
                                .bookingRoom(data);
                          },
                          widget: const Text("Book"))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
