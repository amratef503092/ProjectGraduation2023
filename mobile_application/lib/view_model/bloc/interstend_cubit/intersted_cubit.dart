import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/interested_model/intersted_model.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';
import 'package:meta/meta.dart';

import '../../database/network/end_points.dart';

part 'intersted_state.dart';

class InterstedCubit extends Cubit<InterstedState> {
  InterstedCubit() : super(InterstedInitial());

  static InterstedCubit get(context) =>
      BlocProvider.of<InterstedCubit>(context);
  InterstedModel ?interstedModel;
  Future<void> getInterestsData() async
  {
    emit(GetInterstsDataLoadingState());
  await  DioHelper.getData(url: Intersted).then((value) {
    interstedModel = InterstedModel.fromJson(value.data);
    emit(GetInterstsDataSuccessfulState());

  }).catchError((error)
  {
    if(error is DioError){
      emit(GetInterstsDataErrorState());

    }else{
      emit(GetInterstsDataErrorState());
    }
  });

  }
}
