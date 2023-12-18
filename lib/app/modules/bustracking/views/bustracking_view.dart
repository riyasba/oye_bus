import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/bustracking/views/widget/map.dart';

import '../controllers/bustracking_controller.dart';

class BustrackingView extends GetView<BustrackingController> {
  const BustrackingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Mapsybol extends StatefulWidget {
  const Mapsybol({Key? key}) : super(key: key);

  @override
  State<Mapsybol> createState() => _MapsybolState();
}

final bustrackingController = Get.find<BustrackingController>();

class _MapsybolState extends State<Mapsybol> {
  List<LatLng> polylineCoordinates = [
    LatLng(13.0827, 80.2707), // Chennai
    LatLng(13.0756, 80.2210), // Example point 1
    LatLng(13.0706, 80.2400), // Example point 2
    LatLng(13.0611, 80.2403),
    LatLng(13.0756, 80.2210), // Example point 1
    LatLng(13.0706, 80.2400), // Example point 2
    LatLng(13.0611, 80.2403),
  ];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyB-E9dcvDYK_dQ5UNws7ROvpqp7eQ9tDE4",
      PointLatLng(LatLng(13.0827, 80.2707).latitude,
          LatLng(13.0827, 80.2707).longitude),
      PointLatLng(LatLng(13.0611, 80.2403).latitude,
          LatLng(13.0611, 80.2403).longitude),
    );

    // if (result.points.isNotEmpty) {
    //   result.points.forEach(
    //     (PointLatLng point) => polylineCoordinates.add(
    //       LatLng(point.latitude, point.longitude),
    //     ),
    //   );
    //   setState(() {});
    // }
  }

  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  Location? _location;
  LocationData? _currentLocation;

  @override
  void initState() {
    _init();
    getPolyPoints();
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_chennaiPosition));
  }

  static final CameraPosition _chennaiPosition = CameraPosition(
    target: LatLng(13.0827, 80.2707), // Chennai coordinates
    tilt: 59.0,
    zoom: 15.0,
  );
  _init() async {
    _location = Location();
    _cameraPosition = CameraPosition(
        target: LatLng(
            0, 0), // this is just the example lat and lng for initializing
        zoom: 15);
    _initLocation();
  }

  //function to listen when we move position
  _initLocation() {
    //use this to go to current location instead
    _location?.getLocation().then((location) {
      _currentLocation = location;
    });
    _location?.onLocationChanged.listen((newLocation) {
      _currentLocation = newLocation;
      moveToPosition(LatLng(
          _currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0));
    });
  }

  moveToPosition(LatLng latLng) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 15)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Route Map'),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      // floatingActionButton: InkWell(
      //     onTap: () {
      //       print('andi');
      //       _goToTheLake();
      //     },
      //     child: Bottumnar()),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _getMap();
  }
bool isToggled = false;
  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: ClipOval(
          child: Image.asset(
        "assets/home_page/bus_offer_image.png",
      )),
    );
    //  BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration.empty, 'assets/images/Seart 1.png')
    //     .then(
    //   (icon) {
    //     currentLocationIcon = icon;
    //   },
    // );
  }

  Widget _getMap() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _cameraPosition!,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            // now we need a variable to get the controller of google map
            if (!_googleMapController.isCompleted) {
              _googleMapController.complete(controller);
            }
          },
          polylines: {
            Polyline(
              polylineId: PolylineId('route'),
              points: polylineCoordinates,
            )
          },
          markers: {
            Marker(
                markerId: MarkerId('source'),
                position: LatLng(13.0827, 80.2707)),
            Marker(
              markerId: MarkerId('Destination'),
              position: LatLng(13.0611, 80.2403),
            )
          },
        ),
        Positioned.fill(
            child: Align(alignment: Alignment.center, child: _getMarker())),
        Positioned(
          bottom: 9,
          left: 0,
          right: 0,
          child: InkWell(
              onTap: () {
                  setState(() {
          isToggled = !isToggled;
        });
         
              },
              child: isToggled ? Expandedcontainer()
                  : Bottumnar()),
        )
      ],
    );
  }
}

class Expandedcontainer extends StatelessWidget {
  Expandedcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
        height: 300.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'KRML Kalaimagal BUS',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.w600, fontSize: 16.sp, color: kblack),
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
            ),
            DottedLine(),
            ksizedbox10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Address',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: kblack),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Container(
                        width: 1.2, // Adjust the width of the line
                        height: 30, // Adjust the height of the line
                        color:
                            Colors.black, // Change the color of the line here
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Address',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: kblack),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Container(
                        width: 1.2, // Adjust the width of the line
                        height: 30, // Adjust the height of the line
                        color:
                            Colors.black, // Change the color of the line here
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Address',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: kblack),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Container(
                        width: 1.2, // Adjust the width of the line
                        height: 30, // Adjust the height of the line
                        color:
                            Colors.black, // Change the color of the line here
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Address',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: kblack),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Container(
                        width: 1.2, // Adjust the width of the line
                        height: 30, // Adjust the height of the line
                        color:
                            Colors.black, // Change the color of the line here
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'All stops',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
