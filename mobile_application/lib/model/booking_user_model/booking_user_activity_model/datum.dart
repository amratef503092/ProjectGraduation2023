import 'package:equatable/equatable.dart';

import '../../acitvity_model/activity_model.dart';
import '../../user_model/user_model.dart';

class Datum extends Equatable {
  final int? id;
  final ActivityModel? activity;
  final User? user;
  final String? date;
  final int? numberOfPeople;
  final DateTime? createdAt;

  const Datum({
    this.id,
    this.activity,
    this.user,
    this.date,
    this.numberOfPeople,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        activity: json['activity'] == null
            ? null
            : ActivityModel.fromJson(json['activity'] as Map<String, dynamic>),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        date: json['date'] as String?,
        numberOfPeople: json['number_of_people'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      activity,
      user,
      date,
      numberOfPeople,
      createdAt,
    ];
  }
}
