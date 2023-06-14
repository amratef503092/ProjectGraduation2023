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
class ActivityHistoryScreen extends StatelessWidget {
  const ActivityHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ActivityBookingCubit(sl<BookingUserRepoImpl>())..bookedActivityHistory(),
      child: BlocConsumer<ActivityBookingCubit, ActivityBookingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return (state is GetBookingActivityLoadingState)
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : (state is GetBookingActivityErrorState)
              ? Center(
            child: TextCustom(text: state.message),
          )
              : (state is GetBookingActivitySuccessfullyState)
              ? Scaffold(
            appBar: AppBar
              (
              centerTitle: true,
              backgroundColor: ColorManage.white,
              title: TextCustom(
                text: "Activity History",
                fontSize: 20.sp,
                color: ColorManage.primaryBlue,
              ),
            ),
                body: ListView.separated(
            itemBuilder: (context, index)
            {
                return  CustomTicketInfo(
                  ticketID: state.bookingUserActivityModel.data![index].id.toString(),
                  activityDate: state.bookingUserActivityModel.data![index].date.toString(),
                  activityId: state.bookingUserActivityModel.data![index].activity!.id.toString(),
                  activityLocation: state.bookingUserActivityModel.data![index].activity!.location!,
                  activityName:state.bookingUserActivityModel.data![index].activity!.activityName.toString(),
                  activityNumberOfTickets: state.bookingUserActivityModel.data![index].numberOfPeople.toString(),
                  activityPrice:( state.bookingUserActivityModel.data![index].activity!.activityPrice * state.bookingUserActivityModel.data![index].numberOfPeople).toString(),
                  image:
                  state.bookingUserActivityModel.data![index].activity!.images[0].toString(),
                );
            },
            separatorBuilder: (context, index) {
                return const Divider();
            },
            itemCount:  state.bookingUserActivityModel.data!.length,),
              )
              : const TextCustom(text: "Error");
        },
      ),
    );
  }


}
