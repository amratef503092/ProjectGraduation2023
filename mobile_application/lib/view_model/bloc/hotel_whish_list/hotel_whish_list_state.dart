part of 'hotel_whish_list_cubit.dart';

@immutable
abstract class HotelWhishListState {}

class HotelWhishListInitial extends HotelWhishListState {}
class HotelWhishListLoading extends HotelWhishListState {}
class HotelWhishListLoaded extends HotelWhishListState {
  final HotelModel hotelModel;
  HotelWhishListLoaded({required this.hotelModel});
}
class HotelWhishListError extends HotelWhishListState {
  final Failure error;
  HotelWhishListError({required this.error});
}
class AddHotelWhishListLoading extends HotelWhishListState {}

class AddHotelWhishListSuccesfly extends HotelWhishListState {
  final String message;
  AddHotelWhishListSuccesfly({required this.message});
}
class AddHotelWhishListError extends HotelWhishListState {
  final Failure error;
  AddHotelWhishListError({required this.error});
}

class RemoveHotelWhishListLoading extends HotelWhishListState {}

class RemoveHotelWhishListSuccesfly extends HotelWhishListState {
  final String message;
  RemoveHotelWhishListSuccesfly({required this.message});
}
class RemoveHotelWhishListError extends HotelWhishListState {
  final Failure error;
  RemoveHotelWhishListError({required this.error});
}