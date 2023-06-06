import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constatnts.dart';
import 'package:graduation_project/model/user_model/user_model.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';

import '../../../core/errors/faliuar.dart';

abstract class ProfileRepo
{
  Future<Either<Failure , User>> getProfile();
  Future<Either<Failure , User>> updateProfile(String phone , String nationality );
  Future<Either<Failure , String>> updatePassword(String newPassword);

}
class ProfileRepoImpl extends ProfileRepo
{
  @override
  Future<Either<Failure, User>> getProfile() async
  {
    // TODO: implement getProfile
    try
    {
      Response response =
      await DioHelper.getData(url:
      '/auth/user-profile' ,
      token: getToken()
      );
      return Right(User.fromJson(response.data));
    } on DioError catch (e)
    {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, User>> updateProfile(String phone, String nationality)
 async {
    try{
      Response response =
          await DioHelper.postData(url:
      '/auth/user/update' ,
          data:
          {
            "phone" : phone,
            "nationality" : nationality,
          },
          token: getToken()
      );
      return Right(User.fromJson(response.data));
    } on DioError catch (e)
    {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, String>> updatePassword(String newPassword)
  async {
    // TODO: implement updatePassword
    try
    {
      Response response = await DioHelper.postData(
          url: '/auth/user/update-password',
          data: {
            "password": newPassword,
          },
          token: getToken());
      return Right(response.data['message']);
    } on DioError catch (e)
    {
      return Left(ServerFailure.fromDioError(e));
    }
  }

}