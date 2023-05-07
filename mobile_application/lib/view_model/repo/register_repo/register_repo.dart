import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/registre_model/register_model.dart';
import '../../../model/user_model/user_model.dart';
import '../../database/network/dio-helper.dart';
import '../../database/network/end_points.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterModel>> register(User user);
}

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<Either<Failure, RegisterModel>> register(user) async {
    try {
      Response response =
          await DioHelper.postData(url: signUpEndPoint, data: user.toJson());
      return Right(RegisterModel.fromJson(response.data));
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
