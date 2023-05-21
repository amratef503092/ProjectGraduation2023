import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/room_model/room_model/room_model.dart';
import '../../../repo/room_repo/room_repo.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit(this.roomRepo) : super(RoomInitial());
  static RoomCubit get(context) => BlocProvider.of<RoomCubit>(context);
  RoomRepo roomRepo;
  RoomModel? roomModel;
  Future<void> getRooms(int hotelId) async {
    emit(GetRoomLoadingState());
    var result = await roomRepo.getRoomInfo(hotelId);
    result.fold((l) => emit(GetRoomErrorState(l.toString())), (r) {
      roomModel = r;
      emit(GetRoomSuccessfullyState(r));
    });
  }
}
