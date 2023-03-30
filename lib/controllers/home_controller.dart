// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_map/helpers/API_helper.dart';
import '../helpers/location_helper.dart';
import '../views/componants/details_dailpg.dart';

class HomeController extends GetxController {
  late GoogleMapController googleMapController; //controller for google map
  var  cameraPosition =const  CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 10.4746,
  );

  Set<Circle> circles = HashSet<Circle>(); //circle on map
  final List<Marker> markers = <Marker>[]; // markers on map

  late Position position; //user location
  List doctors = []; //list of doctors

  LocationHelper locationHelper =
      LocationHelper(); // instance of  location helper
  API_helper api_helper = API_helper(); //instance of api helper

  List<LatLng> polylineCoordinates = []; //list of latlng for polyline
  PolylinePoints polylinePoints =
      PolylinePoints(); //instance of polyline points
  Map<PolylineId, Polyline> polylines = {}; //map of polyline id and polyline
  String googleAPiKey =
      "AIzaSyCyxe3h_ln3tcufkdQxnDIE9XYr2GxLwiw"; //google api key

  @override
  void onInit() {
    super.onInit();
    //get doctors from api
    api_helper.getDoctors().then((value) {
      doctors = value;
      update();
    });
  }


  // get user current location

  Future getMyCurrentLocation() async {
    position = await locationHelper.getUserCurrentLocation();
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 12)));

    markers.add(Marker(
        markerId: MarkerId(position.latitude.toString()),
        infoWindow: InfoWindow(title: 'My Location'),
        position: LatLng(position.latitude, position.longitude)));

    circles.add(Circle(
        circleId: const CircleId('currentLocation'),
        center: LatLng(position.latitude, position.longitude),
        radius: 800,
        fillColor: Colors.blue.withOpacity(0.2),
        strokeWidth: 1,
        strokeColor: Colors.blue));
    update();
  }


  //add marker on map
  void addMarker(latLng, name, nameDepartment, price, id) {
    markers.add(Marker(
      markerId: MarkerId(latLng.toString()),
      icon: BitmapDescriptor.defaultMarkerWithHue(100),
      position: latLng,
      onTap: () {
        Get.dialog(details_dialog(name, nameDepartment, price, id));
      },
    ));
    update();
  }

  //search doctors by name

  void searchDoctors(String value) {
    doctors.forEach((element) {
      if (element.name.toString().contains(value.toLowerCase())) {
        addMarker(LatLng(element.latitude, element.longitude), element.name,
            element.nameDepartment, element.servicePrice, element.id);
      }
    });

    if (value.isEmpty) {
      markers.removeRange(1, markers.length);
    }
    update();
  }

  //**********get polyline**********//

//add  polyline
  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    update();
  }

//get polyline
  getPolyline(latitude, longitude) async {
    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleAPiKey,
          PointLatLng(position.latitude, position.longitude),
          PointLatLng(latitude, longitude),
          travelMode: TravelMode.driving);
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          print("polylineCoordinates _ added");
        });
      }
      addPolyLine();
    } catch (e) {
      print(e);
    }
  }
}