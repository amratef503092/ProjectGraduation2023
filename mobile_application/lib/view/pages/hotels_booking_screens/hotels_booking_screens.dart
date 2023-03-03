import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';

import '../../components/core_components/custom_card_bookling/custom_card_booking.dart';
import '../hotel_details_screen/hotel_details_screen.dart';
import 'componanets/custom_hotel_card/custom_hotel_card.dart';

class HotelBookingScreen extends StatelessWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // header
                Container(
                  height: 200.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  color: ColorManage.primaryBlue,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: ColorManage.primaryYellow,
                          ),
                        ),
                        Text(
                          "Hotel Booking",
                          style: TextStyle(
                              color: ColorManage.background,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.history,
                                color: ColorManage.background,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.bookmark_border,
                                color: ColorManage.background,
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 183.w,
                  top: 150.h,
                  child: CustomCardBooking(),
                ),
                // CardSearch
              ],
            ),
            SizedBox(
              height: 320.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Accomodations In Hochiminh City",
                    style: getMediumStyle(
                        color: ColorManage.primaryBlue,
                        fontSize: 28,
                        height:
                            toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
                  ),
                  Text(
                    "Complete your holiday by staying here",
                    style: getRegularStyle(
                        color: ColorManage.black,
                        height:
                            toFigmaHeight(figmaHeight: 25.sp, fontSize: 16.sp)),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 400.h,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: index,

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTopHotelCard(
                              save: (){},
                              functionCard: () {},
                              image:
                                  "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
                              title: "A&Em selection hotel",
                              function: ()
                              {
                                Navigator.push(context, MaterialPageRoute(builder:
                                (context) {
                                  return HotelDetailsScreen(index: index,);
                                },
                                ));
                              },
                              discount: "80",
                              price: "90",
                              rate: 20,
                              reviwe: "90",
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    "All Accomodations in Hochiminh City",
                    style: getMediumStyle(
                        color: ColorManage.primaryBlue,
                        fontSize: 28,
                        height:
                            toFigmaHeight(figmaHeight: 36.sp, fontSize: 28.sp)),
                  ),
                  Text(
                    "Practical facilities, enjoyable stay",
                    style: getRegularStyle(
                        color: ColorManage.black,
                        height:
                            toFigmaHeight(figmaHeight: 25.sp, fontSize: 16.sp)),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTopHotelCard(
                          save: (){},
                          cardHeight: 340,
                          cardWidth: 270,
                          imageWidth: 366.w,
                          imageHeight: 145,
                          functionCard: () {},
                          image:
                              "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
                          title: "A&Em selection hotel",
                          function: () {},
                          discount: "80",
                          price: "90",
                          rate: 20,
                          reviwe: "90",
                        ),
                      );
                    },
                    itemCount: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}


class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    this.maxHeight = 600,
    this.minHeight = 200,
    required this.widget,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final Widget widget;
  final double maxHeight;
  final double minHeight;
  final IconData icon;

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
          elevation: 10,
          enableDrag: true,
          constraints: BoxConstraints(
            maxHeight: maxHeight,
            minHeight: minHeight,
          ),
          shape: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManage.background,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget,
            );
          },
        );
      },
      child: Container(
        width: 342.w,
        height: 36.h,
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        decoration: BoxDecoration(
          color: ColorManage.background,
          border: Border(
              bottom: BorderSide(color: ColorManage.nonActive, width: 2.w)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: ColorManage.primaryBlue,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              text,
              style:
                  getRegularStyle(color: ColorManage.secondaryBlack, height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
