import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/faliuar.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';

import '../../../model/interested_model/intersted_model.dart';
import '../../database/network/end_points.dart';

abstract class InterstedRepo {
  Future<Either<Failure, InterstedModel>> getInterstedData();
}

class InterstedRepoImpl extends InterstedRepo {
  @override
  Future<Either<Failure, InterstedModel>> getInterstedData() async {
    try {
      Response response = await DioHelper.getData(url: getInterstedEndPoint);
      return Right(InterstedModel.fromJson(response.data));
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
