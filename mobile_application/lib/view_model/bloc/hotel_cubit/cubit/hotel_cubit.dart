import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/hotel_model/hotel_model.dart';
import 'package:meta/meta.dart';

import '../../../repo/hotel_repo/hotel_repo.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit(this.hotelRepo) : super(HotelInitial());
  static HotelCubit get(context) => BlocProvider.of<HotelCubit>(context);
  HotelRepo hotelRepo;
  HotelModel? hotelModel;
  Future<void> getHotel() async {
    emit(GetHotelLoadingState());
    var result = await hotelRepo.getHotelInfo();

    result.fold((l) => emit(GetHotelErrorState(l.toString())), (r) {
      emit(GetHotelSuccessfullyState(r));
    });
  }
  void emitState()
  {
    emit(ChangeState());
  }
}
