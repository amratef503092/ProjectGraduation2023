import '../user_model/user_model.dart';

class LoginModel {
  LoginModel({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn, 
      this.user,});

  LoginModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? accessToken;
  String? tokenType;
  num? expiresIn;
  User? user;


}

