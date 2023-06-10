import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/constatnts.dart';
import 'package:graduation_project/core/errors/faliuar.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';

import '../../../model/booking_user_model/booking_user_activity_model/booking_user_activity_model.dart';

abstract class BookingUserActivityRepo {
  Future<Either<Failure, BookingUserActivityModel>> getBookingUser();
}

class BookingUserRepoImpl extends BookingUserActivityRepo {
  @override
  Future<Either<Failure, BookingUserActivityModel>> getBookingUser() async {
    try {
      Response response = await DioHelper.getData(
        url: "/activiy/user/activity",
        token: getToken(),
      );
      return Right(BookingUserActivityModel.fromJson(response.data));
    } on DioError catch (error) {
      debugPrint(error.response!.data);
      return Left(ServerFailure.fromDioError(error));
    } catch (error) {
      debugPrint(error.toString());
      return Left(FailureLocal(message: error.toString()));
    }
  }
}
