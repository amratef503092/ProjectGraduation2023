part of 'room_cubit.dart';

abstract class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class GetRoomLoadingState extends RoomState {}

class GetRoomSuccessfullyState extends RoomState {
  final RoomModel roomModel;
  GetRoomSuccessfullyState(this.roomModel);
}

class GetRoomErrorState extends RoomState {
  final String error;
  GetRoomErrorState(this.error);
}
