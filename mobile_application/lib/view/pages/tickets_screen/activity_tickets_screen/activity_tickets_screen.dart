import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/service_locator/service_locator.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view/components/text/text_custom.dart';

import '../../../../core/resource/color_mananger.dart';
import '../../../../view_model/bloc/activity_booking_cubit/cubit/activity_booking_cubit.dart';
import '../../../../view_model/repo/booked_activity_repo/booked_activity_repo.dart';
import '../../../../view_model/repo/booking_user_repo/booking_user_repo.dart';
import '../../../components/tickets/custom_teckites.dart';

class ActivityTicketsScreen extends StatelessWidget {
  const ActivityTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ActivityBookingCubit(sl<BookingUserRepoImpl>())..bookedActivity(),
      child: BlocConsumer<ActivityBookingCubit, ActivityBookingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return const CustomTicketInfo(
                  activityDate: "",
                  activityId: "",
                  activityLocation: "",
                  activityName: "",
                  activityNumberOfTickets: "",
                  activityPrice: "",
                  image:
                      "https://media.istockphoto.com/id/1146532466/photo/abstract-blue-digital-background.jpg?s=612x612&w=0&k=20&c=RkhNiZpHTQkx8p6FPiHgZtcWr_o2WabZLgDAVFHTS8g=",
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: 10);
        },
      ),
    );
  }
}
