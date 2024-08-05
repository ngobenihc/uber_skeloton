import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Driverhome extends StatefulWidget {
  const Driverhome({Key? key}) : super(key: key);

  @override
  State<Driverhome> createState() => _DriverhomeState();
}

class _DriverhomeState extends State<Driverhome> {
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newcontrollerGoogleMap;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newcontrollerGoogleMap = controller;
            },
          )
        ],
      ),
    );
  }
}
