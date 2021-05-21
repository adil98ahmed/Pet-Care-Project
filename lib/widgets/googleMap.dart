import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_care/models/doctor_model.dart';
import 'package:pet_care/models/petServicesModel.dart';

// ignore: must_be_immutable
class GoogleMapWidget extends StatelessWidget {
  GoogleMapWidget({this.doctor, this.petServices});
  final Doctor doctor;
  final PetServices petServices;
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    var locationInfo;
    var name, userType;
    if (doctor == null && petServices != null) {
      locationInfo = petServices.location;
      name = petServices.name;
      userType = petServices.serviceName;
    } else if (petServices == null && doctor != null) {
      locationInfo = doctor.locationDr;
      name = doctor.firstName;
      userType = doctor.specialist;
    } else {
      locationInfo = Location(lat: 0, long: 0);
    }
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(locationInfo.lat, locationInfo.long),
      zoom: 14.4746,
    );
    var myMarker = Marker(
        markerId: MarkerId("1"),
        position: LatLng(0, 0),
        visible: true,
        infoWindow: InfoWindow(title: "$name", snippet: "$userType"));
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      scrollGesturesEnabled: true,
      markers: Set.of(
        [myMarker],
      ),
    );
  }
}
