import '../login_model/login_model.dart';
import '../user_model/user_model.dart';

class RegisterModel {
  RegisterModel({
      this.message, 
      this.meg, 
      this.user,});

  RegisterModel.fromJson(dynamic json) {
    message = json['message'];
    meg = json['meg'];
    user = json['data'] != null ? User.fromJson(json['data']) : null;
  }
  String? message;
  String? meg;
  User? user;

}

