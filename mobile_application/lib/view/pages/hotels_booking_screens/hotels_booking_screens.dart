import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view/components/core_components/custom_text_form_faild.dart';
class HotelBookingScreen extends StatelessWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
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
            Positioned(
              left: MediaQuery.of(context).size.width/2-183.w,
              top: 150.h,
              child: Container(
                height: 346.h,
                width: 366.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w , ),
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
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomBottomSheet(
                      icon: Icons.location_on_outlined,
                      text: "Location",
                      widget: SizedBox(
                          width: double.infinity,
                          child: Text("Location")),

                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children:
                      [
                        SizedBox(
                          width: 211.w,
                          child:                   const      CustomBottomSheet(
                            icon: Icons.calendar_today,
                            text: "Sun, 4 Oct 2020",
                            widget: SizedBox(
                                width: double.infinity,
                                child: Text("Sun, 4 Oct 2020")),

                          ),

                        ),
                        SizedBox(width: 10.w,),
                        SizedBox(
                          width: 115.w,
                          child: const CustomBottomSheet(
                            icon: Icons.nightlight_outlined,
                            text: "1 night(s)",
                            widget: SizedBox(
                                width: double.infinity,
                                child: Text("Location")),

                          ),
                        ),


                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Text("Check-out: Mon, 5 Otc 2020",
                        style: getRegularStyle(
                            fontSize: 20.sp,
                            color: ColorManage.gray,
                            height: 1)
                    ),
                    Row(

                      children:
                      [
                        SizedBox(
                          width: 211.w,
                          child:                   const      CustomBottomSheet(
                            icon: Icons.family_restroom,
                            text: "1 guest(s)",
                            widget: SizedBox(
                                width: double.infinity,
                                child: Text("Sun, 4 Oct 2020")),

                          ),

                        ),
                        SizedBox(width: 10.w,),
                        SizedBox(
                          width: 115.w,
                          child: const CustomBottomSheet(
                            icon: Icons.bed,
                            text: "1 room(s)",
                            widget: SizedBox(
                                width: double.infinity,
                                child: Text("Location")),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10.h,),
                    const CustomBottomSheet(
                      icon: FontAwesomeIcons.filter,
                      text: "Filter",
                      widget: SizedBox(
                          width: double.infinity,
                          child: Text("Location")),
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children:

                      [
                        CustomButton(widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.map),
                            SizedBox(width: 10.w,),
                            Text("Map")
                          ],
                        ), function: ()
                        {

                        }, color: ColorManage.primaryYellow,
                        size: Size(163.w,52.h),
                        ),
                        SizedBox(width: 20.w,),
                        CustomButton(widget: Text(
                          "Search",
                          style: getSemiBoldStyle(color: ColorManage.background,
                              height: 1 ,
                          fontSize: 20.sp
                          ),
                        ), function: ()
                        {

                        }, color: ColorManage.primaryYellow,
                          size: Size(163.w,52.h),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),

                  ],
                ),
              ),

            ),
            // CardSearch
            

          ],
        ),
      )
    );
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
  final IconData icon ;
  final String text ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showBottomSheet(
        elevation: 10,
        enableDrag: true,
        constraints:  BoxConstraints(
          maxHeight: maxHeight,
          minHeight: minHeight,
        ),
        shape:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManage.background,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.r)
           ))
        ,context: context, builder:(context) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: widget,
           );
        },);
      },
      child: Container
        (

        width: 342.w,
         height: 36.h,
        padding: EdgeInsets.symmetric(horizontal: 5.w , ),
        decoration: BoxDecoration(
          color: ColorManage.background,
          border: Border(
             bottom: BorderSide(
               color: ColorManage.nonActive,
               width: 2.w
             )
          ),
        ),
        child: Row(
          children:
          [
              Icon(
               icon,
              color: ColorManage.primaryBlue,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(text,
            style: getRegularStyle(color: ColorManage.secondaryBlack,
                height: 1),
            ),

          ],
        ),

      ),
    );
  }
}
