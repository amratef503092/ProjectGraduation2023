import 'package:equatable/equatable.dart';

import 'datum.dart';

class BookingUserActivityModel extends Equatable {
  final String? message;
  final int? statusCode;
  final List<Datum>? data;

  const BookingUserActivityModel({
    this.message,
    this.statusCode,
    this.data,
  });

  factory BookingUserActivityModel.fromJson(Map<String, dynamic> json) {
    return BookingUserActivityModel(
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, statusCode, data];
}
