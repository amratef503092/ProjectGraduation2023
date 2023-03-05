import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
import '../hotels_booking_screens/hotels_booking_screens.dart';

class HotelDetailsScreen extends StatelessWidget {
  HotelDetailsScreen({Key? key, required this.index}) : super(key: key);
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 3,
          animationDuration: Duration(milliseconds: 500),
          child: Column(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Hero(
                          tag: index.toString(),
                          transitionOnUserGestures: false,
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
                                    "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
                                  ),
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                )
                              ]),
                        ),
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
                                  ),
                                )
                              : Center(
                                  child: Icon(
                                  Icons.bookmark_border,
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
                        child: Icon(Icons.share_outlined),
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
                        child: const Icon(Icons.arrow_back_ios_new),
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
                    tabs: const [
                      Tab(
                        text: "Booking",
                      ),
                      Tab(
                        text: "About",
                      ),
                      Tab(
                        text: "Reviews",
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
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ListView(
                              children: [
                                Text(
                                  "All Accomodations in Hochiminh City",
                                  style: getMediumStyle(
                                      color: ColorManage.primaryBlue,
                                      fontSize: 28,
                                      height: toFigmaHeight(
                                          figmaHeight: 36.sp, fontSize: 28.sp)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                      itemSize: 30.sp,
                                    ),
                                    Text(
                                      "(532 review)",
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
                                    Text(
                                      "1.3 km from current location",
                                      style: getRegularStyle(
                                          color: ColorManage.black,
                                          height: toFigmaHeight(
                                              figmaHeight: 18.sp,
                                              fontSize: 20.sp)),
                                    ),
                                    Spacer(),
                                    Text(
                                      "150",
                                      style: getRegularStyle(
                                          color: ColorManage.redError,
                                          height: toFigmaHeight(
                                              figmaHeight: 18.sp,
                                              fontSize: 20.sp)),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Text(
                                      "80\$",
                                      style: getRegularStyle(
                                          textDecoration:
                                              TextDecoration.lineThrough,
                                          color: ColorManage.gray,
                                          height: toFigmaHeight(
                                            figmaHeight: 18.sp,
                                            fontSize: 20.sp,
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: CustomBottomSheet(
                                        icon: Icons.calendar_today,
                                        text: "Sun, 4 Oct 2020",
                                        widget: SizedBox(
                                            width: double.infinity,
                                            child: Text("Sun, 4 Oct 2020")),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    const Expanded(
                                      child: CustomBottomSheet(
                                        icon: Icons.nightlight_outlined,
                                        text: "1 night(s)",
                                        widget: SizedBox(
                                            width: double.infinity,
                                            child: Text("Location")),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Center(
                                  child: Text("Check-out: Mon, 5 Otc 2020",
                                      style: getRegularStyle(
                                          fontSize: 20.sp,
                                          color: ColorManage.gray,
                                          height: 1)),
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: CustomBottomSheet(
                                        icon: Icons.family_restroom,
                                        text: "1 guest(s)",
                                        widget: SizedBox(
                                            width: double.infinity,
                                            child: Text("Sun, 4 Oct 2020")),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    const Expanded(
                                      child: CustomBottomSheet(
                                        icon: Icons.bed,
                                        text: "1 room(s)",
                                        widget: SizedBox(
                                            width: double.infinity,
                                            child: Text("Location")),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                CustomButton(
                                  widget: Text("Select Room & Book"),
                                  function: () {
                                    Navigator.pushNamed(context, Routes.SelectRoomScreen);
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  "About",
                                  style: getMediumStyle(
                                      color: ColorManage.primaryBlue,
                                      fontSize: 28.sp,
                                      height: toFigmaHeight(
                                          figmaHeight: 36.sp, fontSize: 28.sp)),
                                ),
                                SizedBox(
                                  height: 32.h,
                                ),
                                Text(
                                  "Description",
                                  style: getMediumStyle(
                                      color: ColorManage.secondaryBlack,
                                      fontSize: 29.sp,
                                      height: toFigmaHeight(
                                          figmaHeight: 30.sp, fontSize: 20.sp)),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                const ExpandableText(
                                  "The Intecontinental Residences Saigon is conveniently located at the Kumho Plaza, which is a walking distance to Saigon Tower , Saigon Trade Center and foreign consulate offices. It is a leisurely 10 minute walk to city parks, zoo and Reunification palace.InterContinental Residences Saigon offers premium residential services and facilities. Other than offering panoramic views of the city on the residences, it offers first- class health club and spa. Live the InterContinental life at Saigon s premier address, where discerning international residents can experience distinctive contemporary living in the city s finest integrated complex.",
                                  expandText: 'show more',
                                  collapseText: 'show less',
                                  maxLines: 5,
                                  linkColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  "Facilities",
                                  style: getMediumStyle(
                                      color: ColorManage.secondaryBlack,
                                      fontSize: 29.sp,
                                      height: toFigmaHeight(
                                          figmaHeight: 30.sp, fontSize: 20.sp)),
                                ),
                                Expanded(
                                    child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
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
                                          Text("Free Wifi")
                                        ],
                                      ),
                                    );
                                  },
                                ))
                              ],
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
                                      return SizedBox(width: 20.w,);
                                    },
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 64.w,
                                        height: 36.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorManage.nonActive
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("${index + 1}"),
                                            SizedBox(width: 5.w,),
                                            Icon(
                                              Icons.star_border,
                                              color: ColorManage.primaryBlue,
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: 5,
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                InkWell(
                                  onTap: ()
                                  {
                                    showDialog(context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Make Review",
                                            style: getMediumStyle(color: ColorManage.primaryBlue,
                                                fontSize: 20.sp,
                                                height: toFigmaHeight(figmaHeight: 24,
                                                    fontSize: 20.sp)),
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  maxLines: 5,
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),

                                                  ),
                                                ),
                                                const SizedBox(height: 20,),
                                                CustomButton(widget: Text("Make Review"), function: (){}
                                                    , color: ColorManage.primaryBlue)
                                              ],
                                            ),
                                          );
                                        },);
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      width: 130.w,
                                      height: 90.h,
                                      child: Card(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text("Create Review",
                                            ),
                                            Icon(Icons.add,

                                            color: ColorManage.primaryBlue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(child: ListView.builder(itemBuilder:
                                    (context, index) {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 150.h,
                                    child: Card(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:  [
                                                const Image(
                                                  image: NetworkImage("https://th.bing.com/th/id/R.57494e6bfd1d080da4d9dbd91d265e37?rik=QhwW6KpZLNgwfA&pid=ImgRaw&r=0"),
                                                ),
                                                SizedBox(width: 10.w,),
                                                Text("Name user")
                                              ],
                                            ),
                                          ),
                                          const Text("Good Review"),
                                        ],
                                      ),
                                    ),
                                  );
                                },itemCount: 10,))
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
      ),
    );
  }
}
