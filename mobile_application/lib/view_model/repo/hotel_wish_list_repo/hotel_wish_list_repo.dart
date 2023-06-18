import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constatnts.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/hotel_model/hotel_model.dart';
import '../../database/network/dio-helper.dart';

abstract class HotelWishListRepo {
  Future<Either<Failure, HotelModel>> getHotelWishListInfo();

  Future<Either<Failure, String>> addHotelToWishList({required int id});

  Future<Either<Failure, String>> removeHotelToWishList({required int id});
}

class HotelWishListRepoImpl extends HotelWishListRepo {
  @override
  Future<Either<Failure, HotelModel>> getHotelWishListInfo() async {
    try {
      Response response =
          await DioHelper.getData(url: "/wishlistHotel", token: getToken());
      return Right(HotelModel.fromMap(response.data));
    } on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
      // TODO
    } catch (error) {
      return Left(FailureLocal(message: error.toString()));
      // TODO
    }
  }

  @override
  Future<Either<Failure, String>> addHotelToWishList({required int id}) async {
    try {
      Response response = await DioHelper.getData(
          url: "/addwishlistHotel/$id", token: getToken());
      return Right(response.data["message"]);
    } on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
      // TODO
    } catch (error) {
      return Left(FailureLocal(message: error.toString()));
      // TODO
    }
  }

  @override
  Future<Either<Failure, String>> removeHotelToWishList(
      {required int id}) async {
    try {
      Response response = await DioHelper.getData(
          url: "/removewishlistHotel/$id", token: getToken());
      return Right(response.data["message"]);
    } on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
      // TODO
    } catch (error) {
      return Left(FailureLocal(message: error.toString()));
      // TODO
    }
  }
}
