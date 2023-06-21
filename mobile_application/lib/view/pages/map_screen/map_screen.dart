import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/model/acitvity_model/activity_model.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view_model/bloc/activity_cubit/activity_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../activity_details_screen/activity_details_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ActivityCubit.get(context).getActivity();
    for (var element in ActivityCubit.get(context).activityModel!.data) {
      markers.add(Marker(
        markerId: MarkerId(element.id.toString()),
        position:  LatLng(
            element.location[0].toDouble(),element.location[1].toDouble()),
      ));
    }
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng( 29.982708441440902,  31.28262492625303),
    zoom: 14.4746,
    bearing: 0,

  );

  List<Marker> markers =
  [
    const Marker(markerId: MarkerId('1'), position: LatLng( 29.982708441440902,  31.28262492625303)),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Map'.tr() ,
        style: TextStyle(
          color: ColorManage.primaryBlue
        ),
        ),
      ),
        body: ActivityCubit.get(context).activityModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                clipBehavior: Clip.none,
                children: [
                  GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    markers: markers.toSet(),

                    onMapCreated: (GoogleMapController controller)
                    {
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
                        children: List.generate(
                            ActivityCubit.get(context)
                                .activityModel!
                                .data.length,
                            (index) => buildCard(
                              model: ActivityCubit.get(context).activityModel!.data[index],
                                lang: ActivityCubit.get(context)
                                    .activityModel!
                                    .data[index]
                                    .location[0]
                                    .toDouble(),
                                lat: ActivityCubit.get(context)
                                    .activityModel!
                                    .data[index]
                                    .location[1]
                                    .toDouble(),
                                name: ActivityCubit.get(context)
                                    .activityModel!
                                    .data[index]
                                    .activityName,
                                address: ActivityCubit.get(context)
                                    .activityModel!
                                    .data[index]
                                    .rate.toString(),
                                phone: 'phone',
                                image:ActivityCubit.get(context)
                                    .activityModel!
                                    .data[index].images[0]
                                ,rate: ActivityCubit.get(context).activityModel!.data[index].rate
                                    )),
                      ),
                    ),
                  )
                ],
              ));
  }

  GestureDetector buildCard(
      {required double lang,
      required double lat,
      required String name,
      required String address,
      required String phone,
      required String image,
      required num rate,
        required ActivityModel model
      }) {
    return GestureDetector(
      onTap: () {
        getLocation(lang, lat);
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Image(
                      image: NetworkImage(image),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name),
                      SizedBox(
                        height: 5.h,
                      ),
                      RatingBar.builder(
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 10,
                        initialRating: rate.toDouble(),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) 
                        {
                          print(rating);
                        },
                      ),
                        CustomButton(
                            size: Size(100.w, 30.h),
                            widget: const Text("Go"),
                            function: ()
                           async {

                             Navigator.push(context,
                                 MaterialPageRoute(builder:
                                     (context)=>   ActivityDetailsScreen(
                                       activityModel:
                                       model,
                                     )));


                              
                            }, color: ColorManage.primaryBlue)
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Future<void> getLocation(double lang, double lat) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(lang, lat),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
  }
}
