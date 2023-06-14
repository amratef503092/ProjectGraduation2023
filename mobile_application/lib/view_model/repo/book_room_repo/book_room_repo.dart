import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/errors/faliuar.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';

import '../../../core/constatnts.dart';
import '../../../model/booking_user_room_model/booking_user_room_model.dart';

abstract class BookingRoomRepo
{
  Future<Either<Failure, RoomBookingModel>> getBookRoom();
  Future<Either<Failure, RoomBookingModel>> getRoomHistory();
}
class BookingRoomRepoImpl extends BookingRoomRepo
{
  @override
  Future<Either<Failure, RoomBookingModel>> getBookRoom() async
  {
    try
    {
      Response response = await DioHelper.getData(
        url: "/hotel/rooms/getBookingRoomByUser/${getUserID()}",
        token: getToken(),
      );
      return Right(RoomBookingModel.fromJson(response.data));
    } on DioError catch(error)
    {
      debugPrint(error.response!.data.toString());
      return Left(ServerFailure.fromDioError(error));
    }
    catch(error)
    {
      debugPrint(error.toString());
      return Left(FailureLocal(message: error.toString()));
    }
  }
  @override
  Future<Either<Failure, RoomBookingModel>> getRoomHistory() async
  {
    try
    {
      Response response = await DioHelper.getData(
        url: "/hotel/rooms/getBookingRoomByUserHistory/${getUserID()}",
        token: getToken(),
      );
      return Right(RoomBookingModel.fromJson(response.data));
    } on DioError catch(error)
    {
      debugPrint(error.response!.data.toString());
      return Left(ServerFailure.fromDioError(error));
    }
    catch(error)
    {
      debugPrint(error.toString());
      return Left(FailureLocal(message: error.toString()));
    }
  }
}