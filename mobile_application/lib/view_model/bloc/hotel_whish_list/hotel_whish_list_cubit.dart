import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/hotel_model/hotel_model.dart';
import '../../repo/hotel_wish_list_repo/hotel_wish_list_repo.dart';

part 'hotel_whish_list_state.dart';

class HotelWhishListCubit extends Cubit<HotelWhishListState>
{
  HotelWhishListCubit(this.hotelWishListRepo) : super(HotelWhishListInitial());
  static HotelWhishListCubit get(context) => BlocProvider.of(context);
  HotelWishListRepo hotelWishListRepo;
  Future<void> getAllWishList()
  async
  {
    emit(HotelWhishListLoading());
    final result = await
    hotelWishListRepo.
      getHotelWishListInfo();
    result.fold((error) {
      emit(HotelWhishListError(error: error));
    }, (data) {
      emit(HotelWhishListLoaded(hotelModel: data));
    });
  }
  Future<void> addAllWishList({required int id})
  async
  {
    emit(AddHotelWhishListLoading());
    final result = await
    hotelWishListRepo.
    addHotelToWishList(id: id);
    result.fold((error) {
      emit(AddHotelWhishListError(error: error));
    }, (data) {
      emit(AddHotelWhishListSuccesfly(message: data));
    });
  }
  Future<void> removeAllWishList({required int id})
  async
  {
    emit(RemoveHotelWhishListLoading());
    final result = await
    hotelWishListRepo.
    removeHotelToWishList(id: id);
    result.fold((error) {
      emit(RemoveHotelWhishListError(error: error));
    }, (data) {
      emit(RemoveHotelWhishListSuccesfly(message: data));
    });
  }
}
