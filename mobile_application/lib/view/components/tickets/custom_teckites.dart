import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resource/color_mananger.dart';
import '../core_components/custom_button.dart';
import '../text/text_custom.dart';

class CustomTicketInfo extends StatelessWidget {
  const CustomTicketInfo({
    super.key,
    required this.activityName,
    required this.activityPrice,
    required this.activityId,
    required this.activityDate,
    required this.activityNumberOfTickets,
    required this.activityLocation,
    required this.image,
  });
  final String activityName;
  final String image;
  final String activityPrice;
  final String activityId;
  final String activityDate;
  final String activityNumberOfTickets;
  final String activityLocation;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Row(
          children: [
            TextCustom(
              text: activityName,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            TextCustom(
              text: "$activityPrice EGP",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image(
                  width: 200.w,
                  height: 200.h,
                  image: NetworkImage(image),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      text: activityId,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextCustom(
                      text: activityDate,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextCustom(
                      text: activityNumberOfTickets,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                      size: Size(150.w, 50.h),
                      widget: Row(children: [
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 10.w,
                        ),
                        TextCustom(
                          text: activityLocation,
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      function: () {},
                      color: ColorManage.primaryBlue,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: TextCustom(
                                text:
                                    "Are you sure you want to cancel this ticket?",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {},
                                  child: TextCustom(
                                    color: ColorManage.primaryBlue,
                                    text: "Cancel",
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: TextCustom(
                                    color: ColorManage.error,
                                    text: "Ok",
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: TextCustom(
                          color: ColorManage.error,
                          text: "Cancel",
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ]);
  }
}
