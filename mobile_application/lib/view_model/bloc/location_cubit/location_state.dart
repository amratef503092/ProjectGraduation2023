part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class GetLocationLoading extends LocationState {}

class GetLocationSuccessful extends LocationState {}

// Get Address From lang and lat
class GetAddressFromLatLngLoading extends LocationState {}

class GetAddressFromLatLngSuccessful extends LocationState {
  final List<Placemark> address;
  GetAddressFromLatLngSuccessful(this.address);
}

class GetAddressFromLatLngError extends LocationState {
  final String error;
  GetAddressFromLatLngError(this.error);
}

class GetDistanceLaoding extends LocationState {}

class GetDistanceSuccessfuly extends LocationState {}

class GetDistanceError extends LocationState {
  String messages;
  GetDistanceError(this.messages);
}
class GetAddressFromLatLngCurrentLoading extends LocationState {}

class GetAddressFromLatLngCurrentSuccessful extends LocationState {
  final List<Placemark> address;
  GetAddressFromLatLngCurrentSuccessful(this.address);
}

class GetAddressFromLatLngCurrentError extends LocationState {
  final String error;
  GetAddressFromLatLngCurrentError(this.error);
}