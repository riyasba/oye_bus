import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  Set<Polyline> _polylines = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Tracking'),
      ),
      body: GoogleMap(
        polylines: _polylines,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          _getRoute();
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(13.0827, 80.2707), // Chennai as the starting point
          zoom: 12.0,
        ),
      ),
    );
  }

  void _getRoute() async {
    final response = await http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?origin=Chennai&destination=Perambur&key=YOUR_API_KEY"));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      List<LatLng> points = _decodePoly(decoded['routes'][0]['overview_polyline']['points']);
      setState(() {
        _polylines.add(
          Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            points: points,
            width: 5,
          ),
        );
      });
      _controller.animateCamera(CameraUpdate.newLatLngBounds(_boundsFromLatLngList(points), 50.0));
    } else {
      throw Exception('Failed to fetch route');
    }
  }

  List<LatLng> _decodePoly(String encoded) {
    var len = encoded.length;
    var index = 0;
    List<LatLng> points = [];
    var lat = 0;
    var lng = 0;
    while (index < len) {
      var b;
      var shift = 0;
      var result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << (shift += 5);
      } while (b >= 0x20);
      var dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;
      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << (shift += 5);
      } while (b >= 0x20);
      var dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;
      var p = LatLng(lat / 1E5, lng / 1E5);
      points.add(p);
    }
    return points;
  }

  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }
}
