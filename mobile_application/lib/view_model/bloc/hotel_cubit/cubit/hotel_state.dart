part of 'hotel_cubit.dart';

@immutable
abstract class HotelState {}

class HotelInitial extends HotelState {}

class GetHotelLoadingState extends HotelState {}

class GetHotelSuccessfullyState extends HotelState {
  final HotelModel hotelModel;
  GetHotelSuccessfullyState(this.hotelModel);
}

class GetHotelErrorState extends HotelState {
  final String message;
  GetHotelErrorState(this.message);
}
class ChangeState extends HotelState {

}