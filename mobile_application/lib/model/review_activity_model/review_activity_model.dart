import 'package:graduation_project/model/user_model/user_model.dart';

class ReviewActivityModel {
  final int rate;

  final String comment;

  final String created_at;
  final UserModel user;

  ReviewActivityModel({
    required this.rate,
    required this.comment,
    required this.created_at,
    required this.user,
  });

  factory ReviewActivityModel.fromJson(Map<String, dynamic> json) =>
      ReviewActivityModel(
        rate: json['rate'],
        comment: json['comment'],
        created_at: json['created_at'],
        user: UserModel.fromJson(json['user']),
      );
}
