import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  List<Marker> markers = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(50.43296265331129, 50.08832357078792),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(50.42796133580664, 50.085749655962),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
      children: [
        GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          markers: markers.toSet(),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 150,
          margin: const EdgeInsets.all(10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
onTap: ()
                {
                  print("Amr");
                  getLocation(50 , 50);
                },
                child: Card(
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        const Text('Name'),
                        const Text('Description'),
                        const Text('Date'),
                        const Text('Time'),
                        const Text('Location'),
                        const Text('Price'),
                        const Text('Capacity'),
                        const Text('Category'),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: 150,
                  child: Column(
                    children: [
                      const Text('Name'),
                      const Text('Description'),
                      const Text('Date'),
                      const Text('Time'),
                      const Text('Location'),
                      const Text('Price'),
                      const Text('Capacity'),
                      const Text('Category'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: 150,
                  child: GestureDetector(
                    onTap: ()
                    {
                      print("Amr");
                      getLocation(50 , 50);
                    },
                    child: Column(
                      children: [
                        const Text('Name'),
                        const Text('Description'),
                        const Text('Date'),
                        const Text('Time'),
                        const Text('Location'),
                        const Text('Price'),
                        const Text('Capacity'),
                        const Text('Category'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      ],
    ));
  }

  Future<void> getLocation(double lang , double lat) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition( CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lat, lang),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414)));
  }

}
