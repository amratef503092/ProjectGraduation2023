part of 'intersted_cubit.dart';

@immutable
abstract class InterstedState {}

class InterstedInitial extends InterstedState {}
class GetInterstsDataLoadingState extends InterstedState{

}
class GetInterstsDataErrorState extends InterstedState{

}
class GetInterstsDataSuccessfulState extends InterstedState{

}

