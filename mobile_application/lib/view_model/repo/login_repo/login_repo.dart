import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/login_model/login_model.dart';
import '../../database/network/end_points.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> login(
      String email, String password);
}

class LoginRepoImpl extends LoginRepo
{
  @override
  Future<Either<Failure, LoginModel>> login(
      String email, String password) async {
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };
    try {
      Response response =
          await DioHelper.postData(url: signInEndPoint, data: data);
      return Right(LoginModel.fromJson(response.data));
    } on DioError catch (e)
    {
      debugPrint("-------------Response Data----------------");
      debugPrint(e.response!.data);
      debugPrint("-------------Response Data----------------");
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
