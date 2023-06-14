import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/booking_user_model/booking_user_activity_model/booking_user_activity_model.dart';
import '../../../repo/booked_activity_repo/booked_activity_repo.dart';
import '../../../repo/booking_user_repo/booking_user_repo.dart';

part 'activity_booking_state.dart';

class ActivityBookingCubit extends Cubit<ActivityBookingState> {
  ActivityBookingCubit(this.bookingUserActivityRepo)
      : super(ActivityBookingInitial());
  static ActivityBookingCubit get(context) =>
      BlocProvider.of<ActivityBookingCubit>(context);
  BookingUserActivityRepo bookingUserActivityRepo;
  Future<void> bookedActivity() async {
    emit(GetBookingActivityLoadingState());
    var result = await bookingUserActivityRepo.getBookingUser();
    result.fold((l) {
      emit(GetBookingActivityErrorState(l.message));
    }, (r) {
      emit(GetBookingActivitySuccessfullyState(r));
    });
  }
  Future<void> bookedActivityHistory() async {
    emit(GetBookingActivityLoadingState());
    var result = await bookingUserActivityRepo.getBookingUserHistory();
    result.fold((l) {
      emit(GetBookingActivityErrorState(l.message));
    }, (r) {
      emit(GetBookingActivitySuccessfullyState(r));
    });
  }

}
