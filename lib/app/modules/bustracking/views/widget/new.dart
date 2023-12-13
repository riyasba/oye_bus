// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:oye_bus/app/components/const.dart';
// import 'package:oye_bus/app/modules/bustracking/views/widget/map.dart';

// class MapSampleState extends State<MapSample> {
//   Completer<GoogleMapController> _controller = Completer();
//   Set<Marker> _markers = {}; // Set to hold markers

//   // ... Other existing code

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: kwhite,
//       child: SafeArea(
//         child: Scaffold(
//           body: Stack(
//             children: [
//               GoogleMap(
//                 mapType: MapType.hybrid,
//                 initialCameraPosition: _kGooglePlex,
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller.complete(controller);
                  
//                   // Add a marker to the map
//                   setState(() {
//                     _markers.add(
//                       Marker(
//                         markerId: MarkerId('YourMarkerId'),
//                         position: LatLng(37.42796133580664, -122.085749655962), // Set your desired coordinates
//                         infoWindow: InfoWindow(
//                           title: 'Your Marker Title',
//                           snippet: 'Your Marker Snippet',
//                         ),
//                         icon: BitmapDescriptor.defaultMarker, // You can set a custom icon here
//                       ),
//                     );
//                   });
//                 },
//                 markers: _markers, // Pass the markers set to the GoogleMap widget
//               ),
              
//               // ... Other existing code
//             ],
//           ),

//           // ... Other existing code
//         ),
//       ),
//     );
//   }

//   // ... Other existing code
// }
