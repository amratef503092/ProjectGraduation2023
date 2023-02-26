import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resource/color_mananger.dart';
import '../../../../../core/resource/style_manager.dart';
import '../../../../components/core_components/custom_button.dart';
class CustomTopHotelCard extends StatelessWidget {
  const CustomTopHotelCard({
    super.key,
    required this.function,
    required this.image,
    required this.discount,
    required  this.price,
    required this.rate,
    required this.reviwe,
    required this.title,
    required this.functionCard,
    this.imageHeight = 145,
    this.imageWidth = 270,
    this.cardHeight =337 ,
    this.cardWidth = 271,
    required this.save,
  });
  final String image;
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        functionCard();
      },
      child: Container(
        height: cardHeight.h,
        width: cardWidth.w,
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
            Expanded(

              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: Image
                      (
                      image: NetworkImage(image),
                    fit: BoxFit.cover,
                      width: imageWidth,
                      height: imageHeight,

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
                        child: Icon(Icons.bookmark_border,
                          size: 14.sp,
                          color: ColorManage.primaryYellow,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      title,
                      style: getMediumStyle(
                          color: ColorManage.black,
                          fontSize: 18.sp,
                          height: toFigmaHeight(
                              figmaHeight: 26.sp, fontSize: 18.sp)),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: rate,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding:
                          const EdgeInsets.symmetric(horizontal: 1.0),
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
                          "($reviwe review)",
                          style: getRegularStyle(
                              color: ColorManage.gray,
                              height: toFigmaHeight(
                                  figmaHeight: 16.sp,
                                  fontSize: 16.sp)),
                        )
                      ],
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
                        )
                      ],
                    ),
                    Row(
                      children: [

                        Text(
                          "$price",
                          style: getRegularStyle(
                              color: ColorManage.redError,
                              height: toFigmaHeight(
                                  figmaHeight: 18.sp,
                                  fontSize: 20.sp)),
                        ),
                        SizedBox(width:12.w ,),
                        Text(
                          "80\$",
                          style: getRegularStyle(
                              textDecoration: TextDecoration.lineThrough,
                              color: ColorManage.gray,
                              height: toFigmaHeight(
                                figmaHeight: 18.sp,
                                fontSize: 20.sp,
                              )),
                        ),
                        Spacer(),
                        CustomButton(widget: Text("Book"),
                            size: Size(80.w,40.h),
                            function: (){
                              function();
                            }, color: ColorManage.primaryYellow)
                      ],
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
