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

}
class SignInErrorState extends AuthState{
  String error;
  SignInErrorState({required this.error});
}
// SignIn state end

// SignIn state start
class SignUpoadingState extends AuthState{}
class SignUpSuccessfulState extends AuthState
{

}
class SignUpErrorState extends AuthState{
  String error;
  SignUpErrorState({required this.error});
}
// SignIn state end
