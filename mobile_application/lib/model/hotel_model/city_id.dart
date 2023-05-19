import 'dart:convert';

import 'package:equatable/equatable.dart';

class CityId extends Equatable {
	final int? id;
	final String? nameAr;
	final String? nameEn;

	const CityId({this.id, this.nameAr, this.nameEn});

	factory CityId.fromMap(Map<String, dynamic> data) => CityId(
				id: data['id'] as int?,
				nameAr: data['name_ar'] as String?,
				nameEn: data['name_en'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'name_ar': nameAr,
				'name_en': nameEn,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CityId].
	factory CityId.fromJson(String data) {
		return CityId.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [CityId] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [id, nameAr, nameEn];
}
