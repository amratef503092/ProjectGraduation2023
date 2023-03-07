part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}
class GetLocationLoading extends LocationState{
}
class GetLocationSuccessful extends LocationState{}
