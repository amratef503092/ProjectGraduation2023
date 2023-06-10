part of 'activity_booking_cubit.dart';

abstract class ActivityBookingState extends Equatable {
  const ActivityBookingState();

  @override
  List<Object> get props => [];
}

class ActivityBookingInitial extends ActivityBookingState {}

class GetBookingActivityLoadingState extends ActivityBookingState {}

class GetBookingActivitySuccessfullyState extends ActivityBookingState {
  BookingUserActivityModel bookingUserActivityModel;
  GetBookingActivitySuccessfullyState(this.bookingUserActivityModel);
}

class GetBookingActivityErrorState extends ActivityBookingState {
  final String message;
  GetBookingActivityErrorState(this.message);
}
