import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/faliuar.dart';
import '../../database/network/dio-helper.dart';
import '../../database/network/end_points.dart';

abstract class VerifyEmailRepo
{
  Future<Either<Failure, String>> sendOtpToVerifyEmail(String email);
  Future<Either<Failure, String>>  verifyEmail(String email , String otp);

}

class VerifyEmailRepoImpl extends VerifyEmailRepo {
  @override
  Future<Either<Failure, String>> sendOtpToVerifyEmail(String email) async {
    try {
      Response response = await DioHelper.postData(
          url: sendOtpEndPoint, data: {"email": email});
      return Right(response.data['message']);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, String>>
  verifyEmail(String email, String otp) async
  {
    try {
      Response response = await DioHelper.postData(
          url: verifyEmailEndPoint, data:
      {
            "email": email,
            "otp": otp
      });
      return Right(response.data['message']);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}