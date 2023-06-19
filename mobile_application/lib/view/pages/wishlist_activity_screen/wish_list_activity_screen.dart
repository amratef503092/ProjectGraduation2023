import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/bloc/activity_whilist_cubit/activity_whilist_cubit.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../view_model/bloc/hotel_whish_list/hotel_whish_list_cubit.dart';
import '../../../view_model/bloc/location_cubit/location_cubit.dart';
import '../../../view_model/repo/whish_list_activity/whish_list_activity.dart';
import '../../components/core_components/custom_animation_list_view/custom_animation_list_view.dart';
import '../../components/core_components/custom_card_activity/custom_Card_activity.dart';
import '../activity_details_screen/activity_details_screen.dart';
class WishListActivityScreen extends StatefulWidget {
  const WishListActivityScreen({super.key});

  @override
  State<WishListActivityScreen> createState() => _WishListActivityScreenState();
}

class _WishListActivityScreenState extends State<WishListActivityScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Wishlist Activity" ,
          style: TextStyle(

            color: ColorManage.primaryBlue,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => ActivityWhilistCubit(
          sl<ActivityWishListRepoImpl>(),
        )..getAllWishList(),
        child: BlocConsumer<ActivityWhilistCubit, ActivityWishState>(
          buildWhen: (previous, current) {
            if (current is ActivityWishListLoaded)
            {
              return true;
            } else {
              return false;
            }
          },
          listener: (context, state) {
            if (state is AddActivityWishListSuccesfly)
            {
              ActivityWhilistCubit.get(context).getAllWishList();
            }
            else if (state is RemoveActivityWishListSuccesfly)
            {
              ActivityWhilistCubit.get(context).getAllWishList();

            }
          },
          builder: (context, state) {
            if (state is ActivityWishListLoading)
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is ActivityWishListLoaded)
            {
              ActivityWhilistCubit cubit = ActivityWhilistCubit.get(context);
              return SizedBox(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.getActivityModel.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AnimationListView(
                      index: index,
                      widget: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            OpenContainer(
                              transitionDuration:
                              const Duration(seconds: 1),
                              transitionType: ContainerTransitionType.fade,
                              closedBuilder: (context, action) =>
                                  CustomCardActivity(
                                    activityModel: state
                                        .getActivityModel.data[index],
                                    isFavorite: state.getActivityModel.data[index].fovourite,
                                    function: ()
                                    {
                                      action();
                                    },
                                    title: state.getActivityModel.data[index]
                                        .activityName ??
                                        "",
                                    image: state
                                        .getActivityModel.data[index].images[0]
                                        .toString(),
                                    functionSave: () {},
                                    location:
                                    "${LocationCubit.get(context).
                                    getLocation(state.getActivityModel.data[index].location[0].toDouble(),
                                        state.getActivityModel.data[index].location[1].toDouble()).toStringAsFixed(2)} ",
                                    rating: state
                                        .getActivityModel.data[index].rate
                                        .toDouble(),
                                    review: state.getActivityModel.data[index]
                                        .review.length
                                        .toString(),
                                    time:
                                    "${state.getActivityModel!.data[index].openTime} AM - ${state.getActivityModel.data[index].closeTime} PM",
                                  ),
                              openBuilder: (context, action) {
                                return ActivityDetailsScreen(
                                  activityModel:
                                  state.getActivityModel.data[index],
                                );
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index)
                  {
                    return SizedBox(
                      height: 5.h,
                    );
                  },
                ),
              );
            } else if (state is ActivityWishListError) {
              return Center(
                child: Text(state.error.message),
              );
            } else {
              return const Center(
                child: Text("No Data"),
              );
            }
          },
        ),
      ),
    );
  }
}
