import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';

import '../../components/core_components/custom_cirecle_avatar/custom_circle_avatar.dart';
import '../../components/social_media_cmponents/Custom_card.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'From The Community',
            style: getSemiBoldStyle(
                color: ColorManage.primaryBlue, fontSize: 28.sp, height: 1),
          ),
        ),
        body: SizedBox(
          child: Padding(
            padding: EdgeInsets.all(18.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stories",
                    style: getSemiBoldStyle(
                        color: ColorManage.secondaryBlack,
                        height: 1,
                        fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // stories
                  SizedBox(
                    height: 150.h,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const CustomCircleAvatar(
                                image:
                                    "https://thumbs.dreamstime.com/b/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg"),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "Name",
                              style: getRegularStyle(
                                  color: ColorManage.secondaryBlack,
                                  height: 1,
                                  fontSize: 16.sp),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 20.w,
                        );
                      },
                    ),
                  ),
                  // card
                 const CustomCardPost(
                    name: "Name",
                    date: "Date",
                    profileImage:
                        "https://thumbs.dreamstime.com/b/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg",
                    images: [
                      "https://thumbs.dreamstime.com/b/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg",
                      "https://thumbs.dreamstime.com/b/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg",
                      "https://thumbs.dreamstime.com/b/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg",
                      ],

                  )
                ],
              ),
            ),
          ),
        ));
  }
}


