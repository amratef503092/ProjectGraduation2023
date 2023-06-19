import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/acitvity_model/activity_model.dart';
import '../../../model/acitvity_model/activity_model.dart';
import '../../repo/whish_list_activity/whish_list_activity.dart';

part 'activity_whilist_state.dart';

class ActivityWhilistCubit extends Cubit<ActivityWishState>
{
  ActivityWhilistCubit(this.activityWishListRepo) : super(ActivityWishlistInitial());
  static ActivityWhilistCubit get(context) => BlocProvider.of(context);
  ActivityWishListRepo activityWishListRepo;
  Future<void> getAllWishList()
  async
  {
    emit(ActivityWishListLoading());
    final result = await
    activityWishListRepo.
    getActivity();
    result.fold((error) {
      emit(ActivityWishListError(error: error));
    }, (data) {
      emit(ActivityWishListLoaded(getActivityModel: data));
    });
  }
  Future<void> addAllWishList({required int id})
  async
  {
    emit(AddActivityWishListLoading());
    final result = await
    activityWishListRepo.
    addActivityToWishList(id: id);
    result.fold((error) {
      emit(AddActivityWishListError(error: error));
    }, (data) {
      emit(AddActivityWishListSuccesfly(message: data));
    });
  }
  Future<void> removeAllWishList({required int id})
  async
  {
    emit(RemoveActivityWishListLoading());
    final result = await
    activityWishListRepo.
    removeActivityToWishList(id: id);
    result.fold((error) {
      emit(RemoveActivityWishListError(error: error));
    }, (data) {
      emit(RemoveActivityWishListSuccesfly(message: data));
    });
  }

}
