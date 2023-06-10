import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/helper_function.dart';
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
    required this.ticketID,
  });

  final String activityName;
  final String image;
  final String ticketID;

  final String activityPrice;
  final String activityId;

  final String activityDate;
  final String activityNumberOfTickets;
  final List<num> activityLocation;

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
                    rowTextWidget(title: "Ticket ID", value: ticketID),
                    SizedBox(
                      height: 10.h,
                    ),
                    rowTextWidget(title: "Date", value: activityDate),

                    SizedBox(
                      height: 10.h,
                    ),

                    rowTextWidget(title: "Number of Ticket : ", value: activityNumberOfTickets),

                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                      size: Size(150.w, 50.h),
                      widget: Row(children: [
                        const Icon(Icons.location_on),
                        SizedBox(
                          width: 10.w,
                        ),
                        TextCustom(
                          text: "Location",
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                      function: () {
                        openMap
                          (
                            activityLocation[0].toDouble(),
                            activityLocation[1].toDouble()
                          );
                      },
                      color: ColorManage.primaryBlue,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context)
                          {
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
                                  child: const TextCustom(
                                    color: ColorManage.primaryBlue,
                                    text: "Cancel",
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const TextCustom(
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

  Row rowTextWidget({required String title, required String value}) {
    return Row(
      children: [
        TextCustom(
          text: title,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        TextCustom(
          text: value,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

