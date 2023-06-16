import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState>
{
  MapsCubit() : super(MapsInitial());
  static MapsCubit get(context) => BlocProvider.of(context);
  List<Marker> markers = [
    const  Marker(

      markerId: MarkerId('1'),
      position: LatLng(50.43296265331129, 50.08832357078792),
    ),
    const  Marker(
      markerId: MarkerId('2'),
      position: LatLng(50.42796133580664, 50.085749655962),
    ),
  ];

}
