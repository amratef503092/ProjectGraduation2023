import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
import '../core_components/custom_cirecle_avatar/custom_circle_avatar.dart';
class CustomCardPost extends StatelessWidget {
  const CustomCardPost({
    Key? key,
    required this.images,
    required this.profileImage,
    required this.name,
    required this.date,

  }) : super(key: key);
  final List<String> images;
  final String profileImage;
  final String name;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              CustomCircleAvatar(
                image:
                profileImage,
                radiusOne: 30.r,
                radiusTwo: 28.r,
                radiusThree: 25.r,
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   name,
                    style: getRegularStyle(
                        color: ColorManage.secondaryBlack,
                        height: 1,
                        fontSize: 16.sp),
                  ),
                  Text(
                    DateFormat.yMMMd().format(DateTime.now()),
                    style: getRegularStyle(
                        color: ColorManage.secondaryBlack,
                        height: 1,
                        fontSize: 16.sp),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: ColorManage.primaryBlue,
                  ))
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          // images
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20.w,
                );
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: ColorManage.primaryBlue,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                    color: ColorManage.primaryBlue,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: ColorManage.primaryBlue,
                  )),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: ColorManage.primaryBlue,
                  )),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          // first like
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w ,vertical: 10.h),
            child: Row(
              children: [
                CustomCircleAvatar(
                  image:
                  "https://thumbs.dreamstime.com/b/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg",
                  radiusOne: 30.r,
                  radiusTwo: 28.r,
                  radiusThree: 25.r,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: getRegularStyle(
                          color: ColorManage.secondaryBlack,
                          height: 1,
                          fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Good trip",
                      style: getRegularStyle(
                          color: ColorManage.secondaryBlack,
                          height: 1,
                          fontSize: 16.sp),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}