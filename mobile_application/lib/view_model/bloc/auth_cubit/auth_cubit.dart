import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view_model/database/network/end_points.dart';
import 'package:meta/meta.dart';

import '../../database/network/dio-helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  bool visibility = true;
  void changeState(){
    visibility =!visibility;
    emit(ChangeState());
  }
  Future<void> signIn({required String email,required String password}) async {
    emit(SignInLoadingState());
    await DioHelper.postData(url: "$baseUrl$signInEndPoint", data:
    {
      "email": email,
      "password": password,
    }).then((value) {
      if (kDebugMode) {
        print(value);
      }
      emit(SignInSuccessfulState());
    }).catchError((error) {
      if (error is DioError) {
        print(error.response!.statusCode);
        print(error.response!.data);
      }
      emit(SignInErrorState());

    });
  }
}
