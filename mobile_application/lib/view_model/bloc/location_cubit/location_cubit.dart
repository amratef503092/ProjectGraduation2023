import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:geocoding/geocoding.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  static LocationCubit get(context)=>BlocProvider.of<LocationCubit>(context);
  Position ? position ;

  Future<void> determinePosition() async
  {
    bool serviceEnabled;
    LocationPermission permission;
    emit(GetLocationLoading());
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Ln services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    position =  await Geolocator.getCurrentPosition();
    emit(GetLocationSuccessful());
  }
  double getLocation(double lat1, double lang2)
  {

    double distance  = Geolocator.distanceBetween(
        position!.latitude,
        position!.longitude,
        lat1,
        lang2
    );
    return distance;
  }
   List<Placemark> ?  address;

  Future<void> getPlaceMark(double lat1, double lang2) async
  {
    emit(GetAddressFromLatLngLoading());
    await placemarkFromCoordinates(lat1, lang2).
    then((value)
    {
      address = value;
      print(value[0].street);
      emit(GetAddressFromLatLngSuccessful(value));
    }).catchError((error){
      emit(GetAddressFromLatLngError('error'));
    });


  }
}
