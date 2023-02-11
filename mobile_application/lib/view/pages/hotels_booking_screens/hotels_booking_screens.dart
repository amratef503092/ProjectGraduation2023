import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/view/components/core_components/custom_text_form_faild.dart';
class HotelBookingScreen extends StatelessWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children:
        [
          // header
          Container(
            height: 200.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            color: ColorManage.primaryBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    color: ColorManage.primaryYellow,),
                ),
                Text("Hotel Booking",
                style: TextStyle(
                  color: ColorManage.background,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold
                ),
                ),
                Row(
                  children: [
                    InkWell
                      (
                      onTap: (){},
                      child: const Icon(
                        Icons.history,
                        color: ColorManage.background,),
                    ),
                    SizedBox(width: 10.w,),
                    InkWell
                      (
                      onTap: (){},
                      child: const Icon(
                        Icons.bookmark_border,
                        color: ColorManage.background,),
                    ),
                  ],
                )
              ]

            ),
          ),
          // CardSearch
          Positioned(
            left: MediaQuery.of(context).size.width/2-183.w,
            child: Container(
              width: 366.w,
              height: 346.h,
              margin: EdgeInsets.only(top: 140.h),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                    CustomTextField(

                        iconData: const Icon(Icons.location_on_outlined),
                        controller: TextEditingController()
                        , hint: "Current Location", fieldValidator: (){

                        }),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: Row(
                        children:
                        [
                          SizedBox(
                            width: 200.w,
                            height: 50.h,
                            child: CustomTextField
                              (
                                iconData: const Icon(Icons.location_on_outlined),
                                controller: TextEditingController()
                                , hint: "Current Location", fieldValidator: (){

                            }),
                          ),
                          SizedBox(
                            width: 100.w,
                            height: 50.h,
                            child: CustomTextField(

                                iconData: Icon(Icons.location_on_outlined),
                                controller: TextEditingController()
                                , hint: "Current Location", fieldValidator: (){

                            }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )

        ],
      )
    );
  }
}
