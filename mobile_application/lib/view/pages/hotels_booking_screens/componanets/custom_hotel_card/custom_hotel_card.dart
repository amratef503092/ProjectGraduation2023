import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/model/hotel_model/hotel_model.dart';
import 'package:graduation_project/view_model/bloc/hotel_whish_list/hotel_whish_list_cubit.dart';
import 'package:graduation_project/view_model/bloc/location_cubit/location_cubit.dart';

import '../../../../../core/resource/color_mananger.dart';
import '../../../../../core/resource/style_manager.dart';
import '../../../../../model/hotel_model/datum.dart';
import '../../../../../view_model/repo/hotel_wish_list_repo/hotel_wish_list_repo.dart';
import '../../../../components/core_components/custom_button.dart';

class CustomTopHotelCard extends StatefulWidget {
   CustomTopHotelCard({super.key,
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
    required this.lang,
    required this.lat,
    required this.isFav ,
    required this.hotelModel,
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
  final double lang;
  final double lat;
   bool ?isFav;
  final HotelModelInfo hotelModel;

  @override
  State<CustomTopHotelCard> createState() => _CustomTopHotelCardState();
}

class _CustomTopHotelCardState extends State<CustomTopHotelCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.functionCard();
      },
      child: Container(
        height: widget.cardHeight.h,
        width: widget.cardWidth.w,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                    width: widget.imageWidth,
                    height: widget.imageHeight,
                  ),
                ),
                BlocConsumer<HotelWhishListCubit, HotelWhishListState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return InkWell(
                      onTap: ()
                      {
                        if (widget.isFav!) {
                          HotelWhishListCubit.get(context).removeAllWishList(
                              id: widget.hotelModel.id!);
                          setState(() {
                            widget.isFav = false;
                          });
                        } else {
                          HotelWhishListCubit.get(context).addAllWishList(
                              id: widget.hotelModel.id!);
                          setState(() {
                            widget.isFav = true;
                          });
                        }
                      },
                      child: Align(
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
                              (widget.isFav ?? false) ? Icons.bookmark : Icons
                                  .bookmark_border,
                              size: 20.sp,
                              color: ColorManage.primaryYellow,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
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
                      widget.title,
                      style: getMediumStyle(
                          color: ColorManage.black,
                          fontSize: 18.sp,
                          height: toFigmaHeight(
                              figmaHeight: 26.sp, fontSize: 18.sp)),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: widget.rate,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding:
                          const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) =>
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                          itemSize: 30.sp,
                        ),
                        Text(
                          "(${widget.reviwe} review)",
                          style: getRegularStyle(
                              color: ColorManage.gray,
                              height: toFigmaHeight(
                                  figmaHeight: 16.sp, fontSize: 16.sp)),
                        )
                      ],
                    ),
                    BlocConsumer<LocationCubit, LocationState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 20.sp,
                              color: ColorManage.primaryBlue,
                            ),
                            Text(
                              "${LocationCubit.get(context).getLocation(
                                  widget.lang, widget.lat).toStringAsFixed(
                                  1)} km from current location",
                              style: getRegularStyle(
                                  color: ColorManage.black,
                                  height: toFigmaHeight(
                                      figmaHeight: 18.sp, fontSize: 20.sp)),
                            )
                          ],
                        );
                      },
                    ),
                    CustomButton(
                        widget: const Text("Book"),
                        size: Size(80.w, 40.h),
                        function: () {
                          widget.function();
                        },
                        color: ColorManage.primaryYellow)
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
