import 'package:graduation_project/model/room_model/room_model/room_model.dart';

import '../room_model/room_model/datum.dart';
import '../user_model/user_model.dart';

class RoomBookingModel {
  final String message;
  final int statusCode;
  final List<DataBookingUserModel> data;

  RoomBookingModel(
      {required this.message, required this.statusCode, required this.data});

  factory RoomBookingModel.fromJson(Map<String, dynamic> json) {
    return RoomBookingModel(
      message: json['message'],
      statusCode: json['statusCode'],
      data: List.from(json['data'])
          .map((e) => DataBookingUserModel.fromJson(e))
          .toList(),
    );
  }
}

class DataBookingUserModel {
  final int id;
  final User user;
  final RoomModelInfo room;
  final int numOfNights;
  final int numOfGuests;
  final String totalPrice;
  final String checkIn;
  final String checkOut;
  final String status;
  final String paymentStatus;
  final String paymentMethod;

  DataBookingUserModel(
      {required this.id,
      required this.user,
      required this.room,
      required this.numOfNights,
      required this.numOfGuests,
      required this.totalPrice,
      required this.checkIn,
      required this.checkOut,
      required this.status,
      required this.paymentStatus,
      required this.paymentMethod});

  factory DataBookingUserModel.fromJson(Map<String, dynamic> json) {
    return DataBookingUserModel(
      id: json['id'],
      user: User.fromJson(json['userInfo']),
      room: RoomModelInfo.fromJson(json['roomInfo']),
      numOfNights: json['num_of_nights'],
      numOfGuests: json['num_of_guests'],
      totalPrice: json['total_price'],
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      status: json['status'],
      paymentStatus: json['payment_status'],
      paymentMethod: json['payment_method'],
    );
  }
}
