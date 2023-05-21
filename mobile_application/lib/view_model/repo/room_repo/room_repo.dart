import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/room_model/room_model/room_model.dart';
import '../../database/network/dio-helper.dart';
import '../../database/network/end_points.dart';

abstract class RoomRepo {
  Future<Either<Failure, RoomModel>> getRoomInfo(int hotelInfoId);
}

class RoomRepoImpl extends RoomRepo {
  @override
  Future<Either<Failure, RoomModel>> getRoomInfo(int hotelInfoId) async {
    try {
      Response response =
          await DioHelper.getData(url: "$getRoomByHotelId/$hotelInfoId");
      return Right(RoomModel.fromJson(response.data));
    } on DioError catch (error) {
      debugPrint(error.response!.data);
      return Left(ServerFailure.fromDioError(error));
    } catch (error) {
      debugPrint(error.toString());
      return Left(FailureLocal(message: error.toString()));
    }
  }
}
