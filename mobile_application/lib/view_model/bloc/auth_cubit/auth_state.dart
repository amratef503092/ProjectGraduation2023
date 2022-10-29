part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class ChangeState extends AuthState{}
// SignIn state start
class SignInLoadingState extends AuthState{}
class SignInSuccessfulState extends AuthState{}
class SignInErrorState extends AuthState{}
// SignIn state end

