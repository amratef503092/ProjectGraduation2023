import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';

part 'booking_hotel_state.dart';

class BookingHotelCubit extends Cubit<BookingHotelState> {
  BookingHotelCubit() : super(BookingHotelInitial());
  static BookingHotelCubit get(context) =>
      BlocProvider.of<BookingHotelCubit>(context);
  String? checkInTime;
  String? timeOfNight;
  int? numberOfGuest;
  int? numberOfbed;
  void setCheckInTime(String checkInTime) {
    this.checkInTime = checkInTime;
    emit(SetCheckInState());
  }

  void settimeOfNight(String timeOfNight) {
    this.timeOfNight = timeOfNight;
    emit(SetTimeOfNight());
  }

  void setnumberOfGuest(int numberOfGuest) {
    this.numberOfGuest = numberOfGuest;
    emit(SetNumberOfGuestState());
  }

  void setNumberOfBed(int numberOfbed) {
    this.numberOfbed = numberOfbed;
    emit(SetnumberOfRoomsState());
  }

  Future<void> bookingRoom(Map<String, dynamic> data) async {
    emit(BookingRoomLoadingState());
    await DioHelper.postData(
      url: "/hotel/rooms/bookRoomID",
      data: data,
    ).then((value) {
      emit(BookingRoomSuccessfullyState());
    }).catchError((error) {
      emit(BookingRoomSuccessfullyState());
    });
  }
}
