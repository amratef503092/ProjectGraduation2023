import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/color_mananger.dart';
import '../../../../core/resource/style_manager.dart';
class CustomCardActivity extends StatelessWidget {
  const CustomCardActivity({
    required this.image,
    required this.title,
    required this.function,
    required this.functionSave,
    required this.rating,
    required this.location,
    required this.review,
    required this.time,
    Key? key,
  }) : super(key: key);
  final String image;
  final String title;
  final double rating;
  final String review;
  final String location;
  final Function function;
  final Function functionSave;
  final String time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: 400.h,
        width: 400.w,
        decoration: BoxDecoration(
          color: ColorManage.background,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: Color.fromRGBO(1, 87, 228, 0.1)),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  top: 20.h,
                  right: 20.w,
                  child: GestureDetector(
                    onTap: () {
                      functionSave();
                    },
                    child: const CircleAvatar(
                      backgroundColor: ColorManage.background,
                      child: Icon(
                        Icons.bookmark_border,
                        color: ColorManage.primaryYellow,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getBoldStyle(
                      color: ColorManage.black, fontSize: 20.sp, height: 1),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Align(
                      child: RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20.r,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 5,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "($review review)",
                      style: getRegularStyle(
                          color: ColorManage.gray, fontSize: 14.sp, height: 1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorManage.primaryBlue,
                          size: 20.r,
                        ),
                        Text(
                          "$location km",
                          style: getRegularStyle(
                              color: ColorManage.gray,
                              fontSize: 14.sp,
                              height: 1),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: ColorManage.primaryBlue,
                          size: 20.r,
                        ),
                        Text(
                          time,
                          style: getRegularStyle(
                              color: ColorManage.gray,
                              fontSize: 14.sp,
                              height: 1),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}