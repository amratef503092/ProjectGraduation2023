import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/model/acitvity_model/activity_model.dart';
import 'package:graduation_project/view_model/bloc/activity_whilist_cubit/activity_whilist_cubit.dart';

import '../../../../core/resource/color_mananger.dart';
import '../../../../core/resource/style_manager.dart';

class CustomCardActivity extends StatefulWidget {
   CustomCardActivity({
    required this.image,
    required this.title,
    required this.function,
    required this.functionSave,
    required this.rating,
    required this.location,
    required this.review,
    required this.time,
    required this.activityModel,
    required this.isFavorite,
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
   bool ? isFavorite;
  final ActivityModel activityModel;

  @override
  State<CustomCardActivity> createState() => _CustomCardActivityState();
}

class _CustomCardActivityState extends State<CustomCardActivity> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
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
                      widget.image,
                      fit: BoxFit.cover,
                    )),
                BlocConsumer<ActivityWhilistCubit, ActivityWishState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Positioned(
                      top: 20.h,
                      right: 20.w,
                      child: GestureDetector(
                        onTap: ()
                        {
                          if (widget.isFavorite!) {
                            ActivityWhilistCubit.get(context).removeAllWishList(
                                id: widget.activityModel.id);
                            setState(() {
                              widget.isFavorite = false;
                              widget.activityModel.fovourite = false;
                            });
                          } else {
                            ActivityWhilistCubit.get(context).addAllWishList(
                                id: widget.activityModel.id);
                            setState(() {
                              widget.isFavorite = true;
                              widget.activityModel.fovourite = true;
                            });
                          }
                        },
                        child:  CircleAvatar(
                          backgroundColor: ColorManage.background,
                          child: Icon(
                            widget.isFavorite !? Icons.bookmark: Icons.bookmark_border,
                            color: ColorManage.primaryYellow,
                          ),
                        ),
                      ),
                    );
                  },
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
                  widget.title,
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
                        initialRating: widget.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20.r,
                        itemBuilder: (context, _) =>
                        const Icon(
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
                      "(${widget.review} review)",
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
                          "${widget.location} km",
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
                          widget.time,
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