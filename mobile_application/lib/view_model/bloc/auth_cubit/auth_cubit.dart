import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/login_model/login_model.dart';
import 'package:graduation_project/model/user_model/user_model.dart';
import 'package:graduation_project/view_model/database/local/cache_helper.dart';
import 'package:graduation_project/view_model/repo/login_repo/login_repo.dart';

import '../../../core/constatnts.dart';
import '../../../model/registre_model/register_model.dart';
import '../../repo/register_repo/register_repo.dart';
import '../../repo/verifyEmail/verify_email_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginRepo, this.registerRepo, this.verifyEmailRepo)
      : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  final LoginRepo loginRepo;
  final RegisterRepo registerRepo;

  final VerifyEmailRepo verifyEmailRepo;
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

  LoginModel? loginModel;

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoadingState());
    var result = await loginRepo.login(email, password);
    result.fold((failure) {
      emit(SignInErrorState(error: failure.message));
    }, (responseLoginData) async {
      loginModel = responseLoginData;
      await CacheHelper.put(key: name, value: loginModel!.user!.name);
      await CacheHelper.put(key: userID, value: loginModel!.user!.id);
      await CacheHelper.put(key: token, value: loginModel!.accessToken);
      emit(SignInSuccessfulState(loginModel: responseLoginData));
    });
  }

  String? email;
  RegisterModel? registerModel;

  Future<void> signUp(User user) async {
    emit(SignUpLoadingState());
    var result = await registerRepo.register(user);
    result.fold((failure) {
      emit(SignUpErrorState(error: failure.message));
    }, (responseRegisterData) async {
      registerModel = responseRegisterData;
      await CacheHelper.put(key: 'name', value: registerModel!.user!.name);

      emit(SignUpSuccessfulState(registerModel: responseRegisterData));
    });
  }

  Future<void> sendOtpVerifyEmail(String email) async {
    emit(SendOtpVerifyEmailLoadingState());
    var result = await verifyEmailRepo.sendOtpToVerifyEmail(email);
    result.fold(
        (failure) => emit(SendOtpVerifyEmailErrorState(error: failure.message)),
        (r) => emit(SendOtpVerifyEmailSuccessfulState(message: r)));
  }

  Future<void> verifyEmail(String otp) async {
    emit(VerifyEmailLoadingState());
    var result = await verifyEmailRepo.verifyEmail(email!, otp);
    result.fold(
        (failure) => emit(VerifyEmailErrorState(error: failure.message)),
        (r) => emit(VerifyEmailSuccessfulState(message: r)));
  }
}
