import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/booking_user_room_model/booking_user_room_model.dart';
import '../../repo/book_room_repo/book_room_repo.dart';

part 'room_booking_state.dart';

class RoomBookingCubit extends Cubit<RoomBookingState>
{
  RoomBookingCubit(this.bookingRoomRepo) : super(RoomBookingInitial());
  static RoomBookingCubit get(context) => BlocProvider.of(context);
  BookingRoomRepo bookingRoomRepo;
  void getBookRoom() async
  {
    emit(RoomBookingLoading());
    final response = await bookingRoomRepo.getBookRoom();
    response.fold(
      (error) => emit(RoomBookingError(error.toString())),
      (data) => emit(RoomBookingSuccess(data)),
    );
  }
  Future<void> getBookRoomHistory()
  async
  {
    emit(RoomBookingLoading());
    final response = await bookingRoomRepo.getRoomHistory();
    response.fold(
      (error) => emit(RoomBookingError(error.toString())),
      (data) => emit(RoomBookingSuccess(data)),
    );
  }
}
