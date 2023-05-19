part of 'booking_hotel_cubit.dart';

abstract class BookingHotelState extends Equatable {
  const BookingHotelState();

  @override
  List<Object> get props => [];
}

class BookingHotelInitial extends BookingHotelState {}

class SetCheckInState extends BookingHotelState {}

class SetTimeOfNight extends BookingHotelState {}

class SetNumberOfGuestState extends BookingHotelState {}

class SetnumberOfRoomsState extends BookingHotelState {}
