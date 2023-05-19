import 'dart:convert';

import 'package:equatable/equatable.dart';

class Review extends Equatable {
	final int? id;
	final int? hotelId;
	final int? userIdId;
	final int? rate;
	final String? comments;
	final dynamic deletedAt;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Review({
		this.id, 
		this.hotelId, 
		this.userIdId, 
		this.rate, 
		this.comments, 
		this.deletedAt, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Review.fromMap(Map<String, dynamic> data) => Review(
				id: data['id'] as int?,
				hotelId: data['Hotel_id'] as int?,
				userIdId: data['userID_id'] as int?,
				rate: data['rate'] as int?,
				comments: data['comments'] as String?,
				deletedAt: data['deleted_at'] as dynamic,
				createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
				updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'Hotel_id': hotelId,
				'userID_id': userIdId,
				'rate': rate,
				'comments': comments,
				'deleted_at': deletedAt,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Review].
	factory Review.fromJson(String data) {
		return Review.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Review] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props {
		return [
				id,
				hotelId,
				userIdId,
				rate,
				comments,
				deletedAt,
				createdAt,
				updatedAt,
		];
	}
}
