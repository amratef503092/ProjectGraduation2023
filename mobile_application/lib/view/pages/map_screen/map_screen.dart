import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:graduation_project/view_model/bloc/location_cubit/location_cubit.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
      options: MapOptions(
        center: LatLng(
            LocationCubit.get(context).position?.latitude ?? 30.033333,
            LocationCubit.get(context).position?.longitude ?? 31.233334),
        zoom: 9,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
      mapController: MapController(

      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
      CurrentLocationLayer(
        followOnLocationUpdate: FollowOnLocationUpdate.always,
        turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
        style: const LocationMarkerStyle(
          marker: DefaultLocationMarker(
            child: Icon(
              Icons.navigation,
              color: Colors.white,
            ),
          ),
          markerSize: Size(40, 40),
          markerDirection: MarkerDirection.heading,
        ),
      ),
      ],
    ));
  }
}
