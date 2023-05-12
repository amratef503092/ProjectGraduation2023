import 'package:graduation_project/model/acitvity_model/activity_model.dart';
import 'package:graduation_project/model/user_model/user_model.dart';

class BookedActivityModel {
  final int statusCode;
  final String message;
  final Data data;
  BookedActivityModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });
  factory BookedActivityModel.fromJson(Map<String, dynamic> json) {
    return BookedActivityModel(
        statusCode: json['statusCode'],
        message: json['message'],
        data: Data.fromJson(json['data']));
  }
}

class Data {
  int id;
  ActivityModel activity;
  User user;
  String date;
  String numberOfPeople;
  String createdAt;

  Data(
      {required this.id,
      required this.activity,
      required this.user,
      required this.date,
      required this.numberOfPeople,
      required this.createdAt});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        activity: ActivityModel.fromJson(json['activity']),
        user: User.fromJson(json['user']),
        date: json['date'],
        numberOfPeople: json['number_of_people'],
        createdAt: json['created_at']);
  }
}
