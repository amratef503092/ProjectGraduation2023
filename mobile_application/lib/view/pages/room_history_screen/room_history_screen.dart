import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../view_model/bloc/Room_booking_cubit/room_booking_cubit.dart';
import '../../../view_model/bloc/activity_booking_cubit/cubit/activity_booking_cubit.dart';
import '../../../view_model/repo/book_room_repo/book_room_repo.dart';
import '../../../view_model/repo/booking_user_repo/booking_user_repo.dart';
import '../../components/text/text_custom.dart';
import '../../components/tickets/custom_teckites.dart';
class RoomHistoryScreen extends StatelessWidget {
  const RoomHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (
        centerTitle: true,
        backgroundColor: ColorManage.white,
        title: TextCustom(
          text: "Room History",
          fontSize: 20.sp,
          color: ColorManage.primaryBlue,
        ),
      ),
        body: BlocProvider(
          create: (context) =>
          RoomBookingCubit(sl.get<BookingRoomRepoImpl>())..getBookRoom(),
          child: BlocConsumer<RoomBookingCubit, RoomBookingState>(
            listener: (context, state) {},
            builder: (context, state) {
              return (state is RoomBookingLoading)
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : (state is RoomBookingError)
                  ? Center(
                child: TextCustom(text: state.message),
              )
                  : (state is RoomBookingSuccess)
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return customCardRoomBooking(state, index);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: state.roomBookingModel.data.length,
                ),
              )
                  : const TextCustom(text: "Error");
            },
          ),
        ));
  }

  Card customCardRoomBooking(RoomBookingSuccess state, int index)
  {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: Image.network(state
                  .roomBookingModel.data[index].room.images![0]
                  .toString())),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                TextCustom(
                  text:
                  " Room Number: ${state.roomBookingModel.data[index].room.id.toString()}",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                TextCustom(
                  text:
                  " Check In:  ${state.roomBookingModel.data[index].checkIn.toString()}",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                TextCustom(
                  text:
                  " Check Out:  ${state.roomBookingModel.data[index].checkOut.toString()}",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                TextCustom(
                  text:
                  " Guest:  ${state.roomBookingModel.data[index].numOfGuests.toString()}",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                TextCustom(
                  text:
                  " Price:  ${state.roomBookingModel.data[index].totalPrice.toString()} EGP",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
