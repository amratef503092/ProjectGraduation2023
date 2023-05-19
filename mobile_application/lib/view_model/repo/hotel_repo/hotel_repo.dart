import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
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
      Response response = await DioHelper.getData(url: getHotelEndPoint);
      return Right(HotelModel.fromMap(response.data));
    } on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } catch (error) {
      return Left(FailureLocal(message: error.toString()));
    }
  }
}
