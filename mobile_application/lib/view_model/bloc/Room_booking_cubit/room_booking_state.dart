part of 'room_booking_cubit.dart';

@immutable
abstract class RoomBookingState {}

class RoomBookingInitial extends RoomBookingState {}
class RoomBookingLoading extends RoomBookingState {}
class RoomBookingSuccess extends RoomBookingState
{
  final RoomBookingModel roomBookingModel;
  RoomBookingSuccess(this.roomBookingModel);
}
class RoomBookingError extends RoomBookingState
{
  final String message;
  RoomBookingError(this.message);
}

