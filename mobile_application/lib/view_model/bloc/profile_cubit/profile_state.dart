part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoadingState extends ProfileState {}
class ProfileSuccessfullyState extends ProfileState
{
  User userModel;
  ProfileSuccessfullyState({required this.userModel});
}
class ProfileErrorState extends ProfileState {
  String error;
  ProfileErrorState({required this.error});
}

class ProfileLoadingUpdateState extends ProfileState {}
class ProfileSuccessfullyUpdateState extends ProfileState
{
  User userModel;
  ProfileSuccessfullyUpdateState({required this.userModel});
}
class ProfileErrorUpdateState extends ProfileState {
  String error;
  ProfileErrorUpdateState({required this.error});
}

class ChangePasswordLoadingState extends ProfileState {}
class ChangePasswordSuccessfullyState extends ProfileState
{
  String message;
  ChangePasswordSuccessfullyState({required this.message});
}
class ChangePasswordErrorState extends ProfileState {
  String error;
  ChangePasswordErrorState({required this.error});
}