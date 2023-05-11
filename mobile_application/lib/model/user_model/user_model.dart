import 'dart:convert';

class UserModel {
  UserModel({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn, 
      this.user,});

  UserModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? accessToken;
  String? tokenType;
  num? expiresIn;
  User? user;
UserModel copyWith({  String? accessToken,
  String? tokenType,
  num? expiresIn,
  User? user,
}) => UserModel(  accessToken: accessToken ?? this.accessToken,
  tokenType: tokenType ?? this.tokenType,
  expiresIn: expiresIn ?? this.expiresIn,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

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
      this.profileImage,
    this.password,
    this.passwordConfirmation,

  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    birthday = json['birthday'];
    gender = json['gender'];
    nationality = json['nationality'];
    status = json['status'];
    location = json['location'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
  }
  num? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? birthday;
  dynamic gender;
  String? nationality;
  String? status;
  List<String>? location;
  String? createdAt;
  String? updatedAt;
  String ?profileImage;
  String ? password;
  String ? passwordConfirmation;

User copyWith({  num? id,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  String? birthday,
  dynamic gender,
  String? nationality,
  String? status,
  List<String>? location,
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
    map['location'] = jsonEncode(location);
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['profile_image'] = profileImage  ?? "https://i.stack.imgur.com/34AD2.jpg";
    map['password'] = password;
    map['password_confirmation'] = passwordConfirmation;
    return map;
  }

}