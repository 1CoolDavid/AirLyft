import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsWidget extends StatefulWidget {
  @override
  MapsWidgetState createState() => MapsWidgetState();
}

class MapsWidgetState extends State<MapsWidget> {
  LatLng initialCameraPosition = LatLng(20.5937, 78.9629);
  late GoogleMapController controller;
  Location location = Location();

  void onMapCreatedFunc(GoogleMapController newController) {
    controller = newController;
    location.onLocationChanged.listen((l) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 13),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 220,
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: initialCameraPosition),
            mapType: MapType.normal,
            onMapCreated: onMapCreatedFunc,
            myLocationEnabled: true,
          ),
        ],
      ),
    );
  }
}
