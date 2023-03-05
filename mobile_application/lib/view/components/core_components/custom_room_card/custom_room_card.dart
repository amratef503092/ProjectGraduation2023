import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/resource/color_mananger.dart';
import '../../../../../core/resource/style_manager.dart';
import '../../../../core/resource/assets_manager.dart';
import '../custom_button.dart';

class CustomRoomCard extends StatefulWidget {
  const CustomRoomCard({
    super.key,
    required this.function,
    required this.image,
    required this.discount,
    required this.price,
    required this.rate,
    required this.reviwe,
    required this.title,
    required this.functionCard,
    this.imageHeight = 145,
    this.imageWidth = 270,
    this.cardHeight = 337,
    this.cardWidth = 271,
    required this.save,
  });

  final List<String> image;
  final double rate;
  final String reviwe;
  final String discount;
  final String price;
  final Function function;
  final String title;
  final Function functionCard;
  final double imageHeight;
  final double imageWidth;
  final double cardHeight;
  final double cardWidth;
  final Function save;

  @override
  State<CustomRoomCard> createState() => _CustomRoomCardState();
}

class _CustomRoomCardState extends State<CustomRoomCard> {
  PageController controller = PageController();
  double index2 = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.functionCard();
      },
      child: Container(
        height: 447.h,
        width: 366.w,
        decoration: BoxDecoration(
            color: ColorManage.background,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 30,
                  color: Color.fromRGBO(1, 87, 228, 0.1)),
            ]),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 145.h,
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged: (value) {},
                    itemCount: widget.image.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image(
                          image: NetworkImage(widget.image[index]),
                          width: double.infinity,
                          height: 145.h,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 160.w,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmoothPageIndicator(
                        controller: controller, // PageController
                        count: widget.image.length,
                        effect: const ExpandingDotsEffect(
                            activeDotColor: ColorManage.primaryBlue,
                            dotWidth: 4,
                            dotHeight: 4), // your preferred effect
                        onDotClicked: (index) {}),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: const BoxDecoration(
                        color: ColorManage.background,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.bookmark_border,
                        size: 14.sp,
                        color: ColorManage.primaryYellow,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: getMediumStyle(
                            color: ColorManage.black,
                            fontSize: 18.sp,
                            height: toFigmaHeight(
                                figmaHeight: 26.sp, fontSize: 18.sp)),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "See Details",
                            style: getRegularStyle(
                                fontSize: 14.sp,
                                color: ColorManage.primaryYellow,
                                height: toFigmaHeight(
                                    figmaHeight: 20.sp, fontSize: 14.sp)),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AssetsManager.peopleIcon),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("1 guest(s)"),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AssetsManager.bedIcon),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("2 Twin bed"),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Text(
                        "Free Wifi",
                        style: getMediumStyle(
                            color: ColorManage.greenCorrect,
                            height: toFigmaHeight(
                                figmaHeight: toFigmaHeight(
                                    figmaHeight: 24.sp, fontSize: 16.sp),
                                fontSize: 16.sp)),
                      ),
                      SizedBox(width: 15.w,),
                      Text(
                        "Free Breakfast",
                        style: getMediumStyle(
                            color: ColorManage.greenCorrect,
                            height: toFigmaHeight(
                                figmaHeight: toFigmaHeight(
                                    figmaHeight: 24.sp, fontSize: 16.sp),
                                fontSize: 16.sp)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Text("Non-refundable",
                  style: getSemiBoldStyle(color: ColorManage.gray,
                      height: toFigmaHeight(figmaHeight: 24.sp,
                          fontSize: 16.sp)),
                  ),
                  Row(
                    children: [
                      Text(
                        "${widget.price}\$",
                        style: getRegularStyle(
                            color: ColorManage.redError,
                            height: toFigmaHeight(
                                figmaHeight: 18.sp, fontSize: 20.sp)),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        "Room/Night",
                        style: getRegularStyle(
                            textDecoration: TextDecoration.none,
                            color: ColorManage.gray,
                            height: toFigmaHeight(
                              figmaHeight: 18.sp,
                              fontSize: 20.sp,
                            )),
                      ),
                      Spacer(),
                      CustomButton(
                          widget: Text("Book"),
                          size: Size(80.w, 40.h),
                          function: () {
                            widget.function();
                          },
                          color: ColorManage.primaryYellow)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
