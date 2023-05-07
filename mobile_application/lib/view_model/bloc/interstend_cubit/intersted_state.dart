part of 'intersted_cubit.dart';

@immutable
abstract class InterstedState {}

class InterstedInitial extends InterstedState {}
class GetInterstsDataLoadingState extends InterstedState{

}
class GetInterstsDataErrorState extends InterstedState{

}

class InterstedLoadingState extends InterstedState{}
class InterstedSuccessfulState extends InterstedState
{
  InterstedModel interstedModel;
  InterstedSuccessfulState({required this.interstedModel});
}
class InterstedErrorState extends InterstedState{
  String error;
  InterstedErrorState({required this.error});
}

