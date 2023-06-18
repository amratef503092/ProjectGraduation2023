import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/bloc/hotel_cubit/cubit/hotel_cubit.dart';
import 'package:graduation_project/view_model/repo/hotel_repo/hotel_repo.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../view_model/bloc/hotel_whish_list/hotel_whish_list_cubit.dart';
import '../../../view_model/repo/hotel_wish_list_repo/hotel_wish_list_repo.dart';
import '../../components/core_components/custom_animation_list_view/custom_animation_list_view.dart';
import '../hotel_details_screen/hotel_details_screen.dart';
import '../hotels_booking_screens/componanets/custom_hotel_card/custom_hotel_card.dart';
class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("WishlistScreen" ,
        style: TextStyle(

          color: ColorManage.primaryBlue,
        ),
        ),
      ),
      body: BlocProvider(
        create: (context) => HotelWhishListCubit(
          HotelWishListRepoImpl(),
        )..getAllWishList(),
        child: BlocConsumer<HotelWhishListCubit, HotelWhishListState>(
          buildWhen: (previous, current) {
            if (current is HotelWhishListLoaded)
            {
              return true;
            } else {
              return false;
            }
          },
          listener: (context, state) {
            if (state is RemoveHotelWhishListSuccesfly)
            {
              HotelWhishListCubit.get(context).getAllWishList();
            }
            else if (state is AddHotelWhishListSuccesfly)
            {
              HotelWhishListCubit.get(context).getAllWishList();

            }
          },
          builder: (context, state) {
            if (state is HotelWhishListLoading)
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HotelWhishListLoaded)
            {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemBuilder: (context, index)
                  {

                    return OpenContainer(
                      transitionDuration:
                      const Duration(milliseconds: 500),
                      openBuilder: (context, action) =>
                          BlocProvider(
                            create:(context) =>  HotelCubit(sl<HotelRepoImpl>()),
                            child: HotelDetailsScreen(
                              hotelModel: state.hotelModel.data![index],
                            ),
                          ),
                      closedBuilder: (context, action) =>
                          AnimationListView(
                            index: index,
                            widget: CustomTopHotelCard(
                              hotelModel: state.hotelModel.data![index],
                              lang: state
                                  .hotelModel.data![index].location![0]
                                  .toDouble(),
                              lat: state
                                  .hotelModel.data![index].location![1]
                                  .toDouble(),
                              save: ()
                              {
                                // if ( state
                                //     .hotelModel.data![index].fovourite!)
                                // {
                                //   setState(() {
                                //     state
                                //         .hotelModel.data![index].fovourite = false;
                                //     print(state
                                //         .hotelModel.data![index].fovourite);
                                //   });
                                //   HotelWhishListCubit.get(context).addAllWishList(id: state
                                //       .hotelModel.data![index].id!);
                                //   setState(() {
                                //     state
                                //         .hotelModel.data![index].fovourite = true;
                                //   });
                                // }
                                // else
                                // {
                                //   HotelWhishListCubit.get(context).addAllWishList(id: state
                                //       .hotelModel.data![index].id!);
                                // }
                              },
                              isFav: state
                                  .hotelModel.data![index].fovourite!,
                              cardHeight: 340,
                              cardWidth: 270,
                              imageWidth: 366,
                              imageHeight: 145,
                              functionCard: () {
                                action();
                              },
                              image: state
                                  .hotelModel.data![index].images![0],
                              title: state
                                  .hotelModel.data![index].hotelName!,
                              function: () {
                                action();
                              },
                              discount: '0',
                              price: '0',
                              rate: state.hotelModel.data![index].rate!
                                  .toDouble(),
                              reviwe: state.hotelModel.data![index]
                                  .reviews!.length
                                  .toString(),
                            ),
                          ),
                    );
                  },
                  itemCount: state.hotelModel.data!.length,
                ),
              );
            } else if (state is HotelWhishListError) {
              return Center(
                child: Text(state.error.message!),
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
