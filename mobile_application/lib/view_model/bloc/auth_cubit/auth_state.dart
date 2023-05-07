part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class ChangeState extends AuthState{}
class RememberMe extends AuthState{}

// SignIn state start
class SignInLoadingState extends AuthState{}
class SignInSuccessfulState extends AuthState
{
  LoginModel loginModel;
  SignInSuccessfulState({required this.loginModel});
}
class SignInErrorState extends AuthState{
  String error;
  SignInErrorState({required this.error});
}
// SignIn state end

// SignIn state start
class SignUpLoadingState extends AuthState{}
class SignUpSuccessfulState extends AuthState
{
  RegisterModel registerModel;
  SignUpSuccessfulState({required this.registerModel});
}
class SignUpErrorState extends AuthState{
  String error;
  SignUpErrorState({required this.error});
}
// SignIn state end

// send otp to virefy Email States
class SendOtpVerifyEmailLoadingState extends AuthState{}
class SendOtpVerifyEmailSuccessfulState extends AuthState
{
  String message;
  SendOtpVerifyEmailSuccessfulState({required this.message});
}
class SendOtpVerifyEmailErrorState extends AuthState{
  String error;
  SendOtpVerifyEmailErrorState({required this.error});
}
// send otp to verify Email States
class VerifyEmailLoadingState extends AuthState{}
class VerifyEmailSuccessfulState extends AuthState
{
  String message;
  VerifyEmailSuccessfulState({required this.message});
}
class VerifyEmailErrorState extends AuthState{
  String error;
  VerifyEmailErrorState({required this.error});
}
// send otp to verify Email States