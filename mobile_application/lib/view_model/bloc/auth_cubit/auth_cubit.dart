import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/login_model/login_model.dart';
import 'package:graduation_project/view_model/database/network/end_points.dart';

import '../../database/network/dio-helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  bool visibility = true;
  bool rememberMe = false;

  void changeState() {
    visibility = !visibility;
    emit(ChangeState());
  }

  void changeStateRemember() {
    rememberMe = !rememberMe;
    emit(RememberMe());
  }
  LoginModel ?loginModel;
  Future<void> signIn({required String email, required String password}) async
  {
    loginModel = null;
    emit(SignInLoadingState());
    await DioHelper.postData(
        url: "$baseUrl$signInEndPoint",
        data: {
      "email": email,
      "password": password,
    }).then((value) {
      if (kDebugMode) {
        print(value);
      }
      loginModel = LoginModel.fromJson(value.data);
      emit(SignInSuccessfulState());
    }).catchError((error) {
      if (error is DioError) {
        emit(SignInErrorState(error: error.response!.data['message']));
      } else {
        emit(SignInErrorState(error: error.toString()));
      }
    });
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String name,
        required String status,
        required String nationality,
      }) async {
    emit(SignInLoadingState());
    await DioHelper.postData(url: "$baseUrl$signUpEndPoint", data: {
      "name": name,
      "email": email,
      "password": password,
      "status": status,
      "nationality":nationality,
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
      // emit(SignInErrorState());
    });
  }
}
