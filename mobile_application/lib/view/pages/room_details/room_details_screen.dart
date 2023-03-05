
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';

import '../../../core/resource/assets_manager.dart';
import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
import '../hotels_booking_screens/hotels_booking_screens.dart';

class RoomDetailsScreen extends StatelessWidget {
  RoomDetailsScreen({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                            autoPlayInterval: Duration(seconds: 3),
                            onPageChanged: (index, reason) {},
                            autoPlayAnimationDuration:
                            Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: const [
                            Image(
                              image: NetworkImage(
                                "https://i.travelapi.com/hotels/1000000/190000/185500/185418/63c38c05_z.jpg"
                              ),
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            )
                          ]),
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
                              offset:
                              Offset(0, 2), // changes position of shadow
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
                      child: Icon(Icons.share_outlined,
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
                      child: const Icon(Icons.arrow_back_ios_new,
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
              children:
              [
                Text("Deluxe Room, 1 King Bed",
                style: getBoldStyle(color: ColorManage.primaryBlue,
                    fontSize: 28.sp,
                    height: toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetsManager.peopleIcon),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text("1 guest(s)"),
                    SizedBox(width: 10.w,),
                    SvgPicture.asset(AssetsManager.bedIcon),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text("2 Twin bed"),
                  ],
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Text("Room Information"),

          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManage.variantBlue1
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
          [
            const Text("Total Price for 4-5 Oct 2020, 1 Night(s), 1 Room(s)"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("29\$ ", style: getBoldStyle(color: ColorManage.redError,
                      height: toFigmaHeight(figmaHeight: 26, fontSize: 30.sp)),),
                  SizedBox(width: 20.w,),
                  Text("50\$ ", style: getBoldStyle(color: ColorManage.gray,
                      textDecoration: TextDecoration.lineThrough,
                      height: toFigmaHeight(figmaHeight: 26, fontSize: 30.sp)),),
                  const Spacer(),
                  CustomButton(
                      size: const Size(80,40),
                      widget: const Text("Book"), function: (){}
                      , color: ColorManage.primaryYellow)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

