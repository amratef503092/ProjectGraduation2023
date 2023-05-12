import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:graduation_project/core/constatnts.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/acitvity_model/activity_model.dart';
import '../../../model/booked_activity/booked_activity_model.dart';
import '../../database/network/end_points.dart';

abstract class BookedActivityRepo {
  Future<Either<Failure, BookedActivityModel>> bookedActivity(
      {required int id, required int numberOfPeople, required String date});
}

class BookedActivityRepoImpl extends BookedActivityRepo {
  @override
  Future<Either<Failure, BookedActivityModel>> bookedActivity(
      {required int id,
      required int numberOfPeople,
      required String date}) async {
    try {
      Response response =
          await DioHelper.postData(url: bookedActivitiyEndPoint, data: {
        'activity_id': id,
        'number_of_people': numberOfPeople,
        'date': date,
        'user_id': getUserID()
      });
      return right(BookedActivityModel.fromJson(response.data));
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
