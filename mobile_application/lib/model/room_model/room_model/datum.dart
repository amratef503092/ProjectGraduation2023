import 'package:equatable/equatable.dart';
import 'package:graduation_project/model/hotel_model/hotel_manager.dart';
import 'package:graduation_project/model/hotel_model/hotel_model.dart';

import '../../hotel_model/datum.dart';

class RoomModelInfo extends Equatable {
  final int? id;
  final HotelModelInfo? hotelInfo;
  final int? numnberOfBeds;
  final bool? booked;
  final String? priceperDay;
  final String? descripions;
  final List<String>? images;

  const RoomModelInfo({
    this.id,
    this.hotelInfo,
    this.numnberOfBeds,
    this.booked,
    this.priceperDay,
    this.descripions,
    this.images,
  });

  factory RoomModelInfo.fromJson(Map<String, dynamic> json) => RoomModelInfo(
        id: json['id'] as int?,
        hotelInfo: json['hotelInfo'] == null
            ? null
            : HotelModelInfo.fromMap(json['hotelInfo'] as Map<String, dynamic>),
        numnberOfBeds: json['numnberOfBeds'] as int?,
        booked: json['booked'] == 0 ? false : true,
        priceperDay: json['priceperDay'] as String ?,
        descripions: json['descripions'] as String?,
        images: List.from(json['images'].map((e) => e)),
      );

  @override
  List<Object?> get props {
    return [
      id,
      hotelInfo,
      numnberOfBeds,
      booked,
      priceperDay,
      descripions,
      images,
    ];
  }
}
