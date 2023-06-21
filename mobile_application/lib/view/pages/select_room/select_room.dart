import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/view_model/bloc/hotel_cubit/cubit/hotel_cubit.dart';
import 'package:graduation_project/view_model/bloc/room_cubit/cubit/room_cubit.dart';
import 'package:graduation_project/view_model/repo/room_repo/room_repo.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../components/core_components/custom_body.dart';
import '../../components/core_components/custom_room_card/custom_room_card.dart';

class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({Key? key, required this.hotelid}) : super(key: key);
  final int hotelid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomCubit(sl.get<RoomRepoImpl>())..getRooms(hotelid),
      child: BlocConsumer<RoomCubit, RoomState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManage.primaryBlue,
            body: CustomBody(
                textAppBar: "Select Room".tr(),
                widget: (state is GetRoomSuccessfullyState)
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0.w, vertical: 20),
                        child: ListView.separated(
                          itemCount: state.roomModel.data!.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                          itemBuilder: (context, index) {
                            return CustomRoomCard(
                              image: state.roomModel.data![index].images!,
                              title: '',
                              save: () {},
                              functionCard: () {
                                Navigator.pushNamed(
                                    context, Routes.RoomDetailsScreen,
                                    arguments: state.roomModel.data![index]);
                              },
                              rate: 0,
                              price: state.roomModel.data![index].priceperDay!
                                  .toString(),
                              discount: "0",
                              function: () {},
                              reviwe: "review",
                              imageHeight: 145.h,
                              imageWidth: 366.w,
                              cardWidth: 366.w,
                              cardHeight: 447.h,
                            );
                          },
                        ),
                      )
                    : (state is GetRoomLoadingState)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Center()),
          );
        },
      ),
    );
  }
}
