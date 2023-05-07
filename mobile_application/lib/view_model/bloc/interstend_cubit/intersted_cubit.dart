import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/interested_model/intersted_model.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';
import 'package:meta/meta.dart';

import '../../database/network/end_points.dart';
import '../../repo/interseted_repo/intersted_repo.dart';

part 'intersted_state.dart';

class InterstedCubit extends Cubit<InterstedState> {
  InterstedCubit(this.interstedRepo) : super(InterstedInitial());

  static InterstedCubit get(context) =>
      BlocProvider.of<InterstedCubit>(context);
  final InterstedRepo interstedRepo;

  Future<void> getInterestsData() async
  {
    emit(InterstedLoadingState());
    var result = await interstedRepo.getInterstedData();
    result.fold((error) {
      emit(InterstedErrorState(error: error.toString()));
    }, (data) {
      emit(InterstedSuccessfulState(interstedModel: data));
    });
  }
  //
  Future<void> userDoIntersted() async
  {
    emit(InterstedLoadingState());
    var result = await interstedRepo.getInterstedData();
    result.fold((error) {
      emit(InterstedErrorState(error: error.toString()));
    }, (data) {
      emit(InterstedSuccessfulState(interstedModel: data));
    });
  }

}
