import 'package:equatable/equatable.dart';
import 'package:graduation_project/model/hotel_model/hotel_manager.dart';
import 'package:graduation_project/model/hotel_model/hotel_model.dart';

import '../../hotel_model/datum.dart';

class Datum extends Equatable {
  final int? id;
  final HotelModelInfo? hotelInfo;
  final int? numnberOfBeds;
  final bool? booked;
  final int? priceperDay;
  final String? descripions;
  final List<String>? images;

  const Datum({
    this.id,
    this.hotelInfo,
    this.numnberOfBeds,
    this.booked,
    this.priceperDay,
    this.descripions,
    this.images,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        hotelInfo: json['hotelInfo'] == null
            ? null
            : HotelModelInfo.fromMap(json['hotelInfo'] as Map<String, dynamic>),
        numnberOfBeds: json['numnberOfBeds'] as int?,
        booked: json['booked'] as bool?,
        priceperDay: json['priceperDay'] as int?,
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
