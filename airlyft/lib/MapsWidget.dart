import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart' as Geo;

class MapsWidget extends StatefulWidget {
  @override
  MapsWidgetState createState() => MapsWidgetState();
}

class MapsWidgetState extends State<MapsWidget> {
  Future<Geo.Position?> getCurrentLocation() async {
    await Geo.Geolocator.getCurrentPosition(
            desiredAccuracy: Geo.LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Geo.Position position) {
      return position;
    }).catchError((e) {
      print(e);
      return null;
    });
  }

  LatLng initialCameraPosition = LatLng(40.445456, -79.943438);
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
    return FutureBuilder(
        future: getCurrentLocation(),
        builder: (BuildContext context, AsyncSnapshot<Geo.Position?> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Container(
              width: 350,
              height: 220,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(snapshot.data?.latitude as double,
                            snapshot.data?.longitude as double)),
                    mapType: MapType.normal,
                    onMapCreated: onMapCreatedFunc,
                    myLocationEnabled: true,
                  ),
                ],
              ),
            );
          } else {
            return Container(
              width: 350,
              height: 220,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: LatLng(40.445456, -79.943438)),
                    mapType: MapType.normal,
                    onMapCreated: onMapCreatedFunc,
                    myLocationEnabled: true,
                  ),
                ],
              ),
            );
          }
        });
  }
}
