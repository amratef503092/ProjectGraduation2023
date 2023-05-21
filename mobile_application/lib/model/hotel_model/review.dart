import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:graduation_project/model/user_model/user_model.dart';

import 'hotel_manager.dart';

class Review extends Equatable {
  final int? id;
  final User? user;
  final int? rate;
  final String? comments;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Review({
    this.id,
    this.user,
    this.rate,
    this.comments,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Review.fromMap(Map<String, dynamic> data) => Review(
        id: data['id'] as int?,
        user: User.fromJson(data['user']),
        rate: data['rate'] as int?,
        comments: data['comment'] as String?,
        deletedAt: data['deleted_at'] as dynamic ?? null,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Review].

  /// `dart:convert`
  ///
  /// Converts [Review] to a JSON string.

  @override
  List<Object?> get props {
    return [
      id,
      user,
      rate,
      comments,
      deletedAt,
      createdAt,
      updatedAt,
    ];
  }
}
