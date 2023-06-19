import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constatnts.dart';
import 'package:graduation_project/model/acitvity_model/activity_model.dart';

import '../../../core/errors/faliuar.dart';
import '../../database/network/dio-helper.dart';

abstract class ActivityWishListRepo {
  Future<Either<Failure, GetActivityModel>> getActivity();

  Future<Either<Failure, String>> addActivityToWishList({required int id});

  Future<Either<Failure, String>> removeActivityToWishList({required int id});
}

class ActivityWishListRepoImpl extends ActivityWishListRepo
{
  @override
  Future<Either<Failure, GetActivityModel>> getActivity() async
  {
    try {
      Response response =
      await DioHelper.getData(url: "/wishlistActivity", token: getToken());
      return Right(GetActivityModel.fromJson(response.data));
    } on DioError catch (error)
    {
      return Left(ServerFailure.fromDioError(error));
      // TODO
    } catch (error)
    {
      return Left(FailureLocal(message: error.toString()));
      // TODO
    }
  }

  @override
  Future<Either<Failure, String>> addActivityToWishList({required int id}) async {
    try {
      Response response = await DioHelper.getData(
          url: "/wishlistActivity2/$id", token: getToken());
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
  Future<Either<Failure, String>> removeActivityToWishList(
      {required int id}) async {
    try {
      Response response = await DioHelper.getData(
          url: "/remove/wishlist/activity/$id", token: getToken());
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
