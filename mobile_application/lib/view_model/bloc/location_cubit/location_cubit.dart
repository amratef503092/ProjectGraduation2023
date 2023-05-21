import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  static LocationCubit get(context) => BlocProvider.of<LocationCubit>(context);
  Position? position;

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    emit(GetLocationLoading());
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Ln services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    position = await Geolocator.getCurrentPosition();
    emit(GetLocationSuccessful());
  }

  double getLocation(double lat1, double lang2) {
    emit(GetLocationLoading());
    double distance = Geolocator.distanceBetween(
        position!.latitude, position!.longitude, lat1, lang2);

    return distance;
  }

  List<Placemark>? address;

  Future<void> getPlaceMark(double lat1, double lang2) async {
    emit(GetAddressFromLatLngLoading());
    await placemarkFromCoordinates(lat1, lang2).then((value) {
      address = value;
      debugPrint(value[0].street);
      emit(GetAddressFromLatLngSuccessful(value));
    }).catchError((error) {
      emit(GetAddressFromLatLngError('error'));
    });
  }
}
