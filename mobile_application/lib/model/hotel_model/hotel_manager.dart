import 'dart:convert';

import 'package:equatable/equatable.dart';

class HotelManager extends Equatable {
	final int? id;
	final String? hotelName;
	final String? facilities;
	final String? ownerName;
	final String? email;
	final dynamic emailVerifiedAt;
	final dynamic rememberToken;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final dynamic locationId;
	final String? image;
	final String? applicationDocuments;

	const HotelManager({
		this.id, 
		this.hotelName, 
		this.facilities, 
		this.ownerName, 
		this.email, 
		this.emailVerifiedAt, 
		this.rememberToken, 
		this.createdAt, 
		this.updatedAt, 
		this.locationId, 
		this.image, 
		this.applicationDocuments, 
	});

	factory HotelManager.fromMap(Map<String, dynamic> data) => HotelManager(
				id: data['id'] as int?,
				hotelName: data['Hotel_name'] as String?,
				facilities: data['facilities'] as String?,
				ownerName: data['owner_name'] as String?,
				email: data['email'] as String?,
				emailVerifiedAt: data['email_verified_at'] as dynamic,
				rememberToken: data['remember_token'] as dynamic,
				createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
				updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
				locationId: data['location_id'] as dynamic,
				image: data['image'] as String?,
				applicationDocuments: data['application_documents'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'Hotel_name': hotelName,
				'facilities': facilities,
				'owner_name': ownerName,
				'email': email,
				'email_verified_at': emailVerifiedAt,
				'remember_token': rememberToken,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'location_id': locationId,
				'image': image,
				'application_documents': applicationDocuments,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HotelManager].
	factory HotelManager.fromJson(String data) {
		return HotelManager.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [HotelManager] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props {
		return [
				id,
				hotelName,
				facilities,
				ownerName,
				email,
				emailVerifiedAt,
				rememberToken,
				createdAt,
				updatedAt,
				locationId,
				image,
				applicationDocuments,
		];
	}
}
