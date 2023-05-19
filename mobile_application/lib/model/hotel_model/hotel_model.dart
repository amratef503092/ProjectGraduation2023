import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class HotelModel extends Equatable {
  final String? message;
  final int? statusCode;
  final List<HotelModelInfo>? data;

  const HotelModel({this.message, this.statusCode, this.data});

  factory HotelModel.fromMap(Map<String, dynamic> data) => HotelModel(
        message: data['message'] as String?,
        statusCode: data['statusCode'] as int?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => HotelModelInfo.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'statusCode': statusCode,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HotelModel].
  factory HotelModel.fromJson(String data) {
    return HotelModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HotelModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [message, statusCode, data];
}
