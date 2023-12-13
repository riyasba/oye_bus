import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oye_bus/app/components/const.dart';


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
    Set<Marker> _markers = {}; 

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  setState(() {
                    _markers.add(
                      Marker(
                        markerId: MarkerId('YourMarkerId'),
                        position: LatLng(37.42796133580664, -122.000749655962), // Set your desired coordinates
                        infoWindow: InfoWindow(
                          title: 'Your Marker Title',
                          snippet: 'Your Marker Snippet',
                        ),
                        icon: BitmapDescriptor.defaultMarker, // You can set a custom icon here
                      ),
                    );
                  });
                
                },
                  markers: _markers,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(0, 158, 158, 158),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(26.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(0, 158, 158, 158),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(26.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(0, 158, 158, 158),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(26.0),
                    ),
                    hintText: 'Search',
                    fillColor: Colors.grey[200],
                    focusColor: Colors.grey[200],
                    isDense: true,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: const Icon(
                      CupertinoIcons.clear,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          floatingActionButton:
              InkWell(onTap: _goToTheLake, child: Bottumnar()),

          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: _goToTheLake,
          //   label: Text('To the lake!'),
          //   icon: Icon(Icons.directions_boat),
          // ),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

class Bottumnar extends StatelessWidget {
  const Bottumnar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 300.w,
          height: 89,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'KRML Kalaimagal BUS',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: kblack),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Thambaram',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: kblack),
                        ),
                        Icon(
                          CupertinoIcons.arrow_up_arrow_down_circle_fill,
                          color: kblack,
                          size: 25.0,
                        ),
                        Text(
                          'koyambedu',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: kblack),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'The bus will arrive in',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: kgrey),
                        ),
                        Text(
                          '24 Min.',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: kblack),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
