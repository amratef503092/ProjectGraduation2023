import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constatnts.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/hotel_model/hotel_model.dart';
import '../../database/network/end_points.dart';

abstract class HotelRepo {
  Future<Either<Failure, HotelModel>> getHotelInfo();
}

class HotelRepoImpl extends HotelRepo {
  @override
  Future<Either<Failure, HotelModel>> getHotelInfo() async {
    try {
      Response response = await DioHelper.getData(url: getHotelEndPoint,
      token: getToken()
      );
      return Right(HotelModel.fromMap(response.data));
    } on DioError catch (error) {
      debugPrint(error.response!.data);
      return Left(ServerFailure.fromDioError(error));
    } catch (error) {
      debugPrint(error.toString());
      return Left(FailureLocal(message: error.toString()));
    }
  }
}
