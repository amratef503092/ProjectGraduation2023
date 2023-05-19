import 'package:graduation_project/model/interested_model/intersted_model.dart';

import '../city_model/city_model.dart';
import '../review_activity_model/review_activity_model.dart';

class GetActivityModel {
  final String message;
  final int statusCode;
  final List<ActivityModel> data;
  GetActivityModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });
  factory GetActivityModel.fromJson(Map<String, dynamic> json) =>
      GetActivityModel(
        data: List<ActivityModel>.from(
            json['data'].map((e) => ActivityModel.fromJson(e))),
        message: json['message'],
        statusCode: json['statusCode'],
      );
}

class ActivityModel {
  final int id;
  final String activityName;
  final dynamic activityPrice;
  final String description;
  final String openTime;
  final String closeTime;
  final CategoryModel category;
  final City city;
  final List<num> location;
  final List<ReviewActivityModel> review;
  final List<String> images;
  final num rate;

  ActivityModel(
      {required this.id,
      required this.activityName,
      required this.activityPrice,
      required this.description,
      required this.openTime,
      required this.closeTime,
      required this.category,
      required this.city,
      required this.location,
      required this.review,
      required this.images,
      required this.rate});

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json['id'],
        activityName: json['activityName'],
        activityPrice: json['activityPrice'],
        description: json['description'],
        openTime: json['openTime'],
        closeTime: json['closeTime'],
        category: CategoryModel.fromJson(json['category']),
        city: City.fromJson(json['city']),
        images: List<String>.from(json['images'].map((e) => e)),
        location: json['location'].cast<num>(),
        review: List.from(json['review'])
            .map((e) => ReviewActivityModel.fromJson(e))
            .toList(),
        rate: json['rate'] ?? 0,
      );
}
