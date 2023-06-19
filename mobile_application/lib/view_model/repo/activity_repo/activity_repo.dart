import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constatnts.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/acitvity_model/activity_model.dart';
import '../../database/network/end_points.dart';

abstract class ActivityRep
{
Future<Either<Failure, GetActivityModel>> getActivityData();
}
class ActivityRepImpl extends ActivityRep
{
  @override
  Future<Either<Failure, GetActivityModel>> getActivityData() async
  {
    try
    {
      Response response = await DioHelper.getData(url: getActivityEndPoints ,
      token: getToken()
      );
      return Right(GetActivityModel.fromJson(response.data));
    } on DioError catch (e)
    {
      return Left(ServerFailure.fromDioError(e));
    }

  }
}