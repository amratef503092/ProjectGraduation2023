import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/resource/color_mananger.dart';
import '../../../../core/resource/style_manager.dart';
import '../../../pages/hotels_booking_screens/hotels_booking_screens.dart';
import '../custom_button.dart';

class CustomCardBooking extends StatelessWidget {
  const CustomCardBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 346.h,
      width: 366.w,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: ColorManage.background,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 10.h,
          ),
          CustomBottomSheet(
            function: () {},
            icon: Icons.location_on_outlined,
            text: "Location",
            widget:
                const SizedBox(width: double.infinity, child: Text("Location")),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 211.w,
                child: CustomBottomSheet(
                  function: () {},
                  icon: Icons.calendar_today,
                  text: "Sun, 4 Oct 2020",
                  widget: const SizedBox(
                      width: double.infinity, child: Text("Sun, 4 Oct 2020")),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 115.w,
                child: CustomBottomSheet(
                  function: () {},
                  icon: Icons.nightlight_outlined,
                  text: "1 night(s)",
                  widget: const SizedBox(
                      width: double.infinity, child: Text("Location")),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Text("Check-out: Mon, 5 Otc 2020",
              style: getRegularStyle(
                  fontSize: 20.sp, color: ColorManage.gray, height: 1)),
          Row(
            children: [
              SizedBox(
                width: 211.w,
                child: CustomBottomSheet(
                  function: () {},
                  icon: Icons.family_restroom,
                  text: "1 guest(s)",
                  widget: const SizedBox(
                      width: double.infinity, child: Text("Sun, 4 Oct 2020")),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 115.w,
                child: CustomBottomSheet(
                  function: () {},
                  icon: Icons.bed,
                  text: "1 room(s)",
                  widget:
                      SizedBox(width: double.infinity, child: Text("Location")),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomBottomSheet(
            function: () {},
            icon: FontAwesomeIcons.filter,
            text: "Filter",
            widget:
                const SizedBox(width: double.infinity, child: Text("Location")),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              CustomButton(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.map),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("Map")
                  ],
                ),
                function: () {},
                color: ColorManage.primaryYellow,
                size: Size(163.w, 52.h),
              ),
              SizedBox(
                width: 20.w,
              ),
              CustomButton(
                widget: Text(
                  "Search",
                  style: getSemiBoldStyle(
                      color: ColorManage.background,
                      height: 1,
                      fontSize: 20.sp),
                ),
                function: () {},
                color: ColorManage.primaryYellow,
                size: Size(163.w, 52.h),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
