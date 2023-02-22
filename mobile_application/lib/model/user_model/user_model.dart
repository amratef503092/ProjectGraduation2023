class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.birthday,
    this.gender,
    this.nationality,
    this.status,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.profileImage,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    birthday = json['birthday'];
    gender = json['gender'];
    nationality = json['nationality'];
    status = json['status'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
  }
  num? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic birthday;
  String? gender;
  String? nationality;
  String? status;
  dynamic location;
  String? createdAt;
  String? updatedAt;
  dynamic profileImage;
  User copyWith({  num? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    dynamic birthday,
    String? gender,
    String? nationality,
    String? status,
    dynamic location,
    String? createdAt,
    String? updatedAt,
    dynamic profileImage,
  }) => User(  id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
    birthday: birthday ?? this.birthday,
    gender: gender ?? this.gender,
    nationality: nationality ?? this.nationality,
    status: status ?? this.status,
    location: location ?? this.location,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    profileImage: profileImage ?? this.profileImage,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['birthday'] = birthday;
    map['gender'] = gender;
    map['nationality'] = nationality;
    map['status'] = status;
    map['location'] = location;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['profile_image'] = profileImage;
    return map;
  }

}