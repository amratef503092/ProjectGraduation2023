import 'package:equatable/equatable.dart';

import 'datum.dart';

class RoomModel extends Equatable {
  final String? message;
  final int? statusCode;
  final List<RoomModelInfo>? data;

  const RoomModel({this.message, this.statusCode, this.data});

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        message: json['message'] as String?,
        statusCode: json['statusCode'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => RoomModelInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  @override
  List<Object?> get props => [message, statusCode, data];
}
