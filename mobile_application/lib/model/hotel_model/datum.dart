import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'city_id.dart';
import 'hotel_manager.dart';
import 'review.dart';

class HotelModelInfo extends Equatable {
  final int? id;
  final HotelManager? hotelManager;
  final int? review;
  final String? hotelName;
  final List<String>? images;
  final List<num>? location;
  final List<String>? options;
  final String? typeOfRoom;
  final CityId? cityId;
  final List<Review>? reviews;
  final num? rate;
  final String? description;

  const HotelModelInfo(
      {this.id,
      this.hotelManager,
      this.review,
      this.hotelName,
      this.images,
      this.location,
      this.options,
      this.typeOfRoom,
      this.cityId,
      this.reviews,
      this.rate,
      this.description});

  factory HotelModelInfo.fromMap(Map<String, dynamic> data) => HotelModelInfo(
      id: data['id'] as int?,
      hotelManager: data['hotelManager'] == null
          ? null
          : HotelManager.fromMap(data['hotelManager'] as Map<String, dynamic>),
      review: data['review'] as int?,
      hotelName: data['hotel_name'] as String?,
      images: List.from(data['images'].map((e) => e)),
      location: List.from(data['location'].map((e) => e)),
      options: List.from(data['OPTIONS'].map((e) => e)),
      typeOfRoom: data['type_of_room'] as String?,
      cityId: data['city_id'] == null
          ? null
          : CityId.fromMap(data['city_id'] as Map<String, dynamic>),
      reviews: (data['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromMap(e as Map<String, dynamic>))
          .toList(),
      rate: data['rate'] ?? 0,
      description: data['description'] as String?);

  Map<String, dynamic> toMap() => {
        'id': id,
        'hotelManager': hotelManager?.toMap(),
        'review': review,
        'hotel_name': hotelName,
        'images': images,
        'location': location,
        'OPTIONS': options,
        'type_of_room': typeOfRoom,
        'city_id': cityId?.toMap(),
        'reviews': reviews?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HotelModelInfo].
  factory HotelModelInfo.fromJson(String data) {
    return HotelModelInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HotelModelInfo] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      hotelManager,
      review,
      hotelName,
      images,
      location,
      options,
      typeOfRoom,
      cityId,
      reviews,
    ];
  }
}
