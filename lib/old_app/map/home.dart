import 'dart:async';
import 'dart:collection';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_map/old_app/map/search.dart';
import 'package:project_map/old_app/map/tab.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class CustomMarkerInfoWindow extends StatefulWidget {
  const CustomMarkerInfoWindow({Key? key}) : super(key: key);
  static const String routName = "home";

  @override
  State<CustomMarkerInfoWindow> createState() => _CustomMarkerInfoWindowState();
}

class _CustomMarkerInfoWindowState extends State<CustomMarkerInfoWindow> {
  Completer<GoogleMapController> _controller = Completer();

  late BitmapDescriptor _markerIcon;
  late BitmapDescriptor _markersIcon;

//===========================================================================
  Set<Circle> _circles = HashSet<Circle>();

  static const CameraPosition kGoogle = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 10.4746,
  );

  //=============================================================

  final List<Marker> _marker = <Marker>[
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(30.033333, 31.233334),
      infoWindow: InfoWindow(
        title: 'My Position',
      ),
    )
  ];

  //==============================================================================

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  //======================================================================================

  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLng = [
    const LatLng(30.572665, 31.272555),
  ];

//===============================================================================

  @override
  void initState() {
    super.initState();
    loadData();
    _setMarkerIcon();
    _setMarkersIcon();
    _setCircles();
  }

// tab marker
  loadData() {
    for (int i = 0; i < _latLng.length; i++) {
      _markers.add(Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.defaultMarkerWithHue(100),
          position: _latLng[i],
          onTap: () {
            _customInfoWindowController.addInfoWindow!(const TabMarker(), _latLng[i]);
          }));

      setState(() {});
    }
  }

//===============================================================================

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  //=========================================================================
// marker clinic and doctor
  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/health-clinic.png",
    );
  }

  void _setMarkersIcon() async {
    _markersIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/surgeon.png",
    );
  }

//==================================================================
  //circles

  void _setCircles() {
    getUserCurrentLocation().then((value) => _circles.add(
          Circle(
              circleId: const CircleId("1"),
              center: LatLng(value.latitude, value.longitude),
              radius: 1000,
              fillColor: Colors.blue.withOpacity(.5),
              strokeWidth: 0),
        ));
  }

//====================================================================

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => MainCubit(),
        child: BlocConsumer<MainCubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: kGoogle,
                    markers: Set<Marker>.of(_markers),
                    onTap: (position) {
                      _customInfoWindowController.hideInfoWindow!();
                    },
                    onCameraMove: (position) {
                      _customInfoWindowController.onCameraMove!();
                    },
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    compassEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _customInfoWindowController.googleMapController =
                          controller;
                      _controller.complete(controller);
                    },
                    circles: _circles,
                  ),
                  CustomInfoWindow(
                    controller: _customInfoWindowController,
                    height: 130,
                    width: 300,
                    offset: 35,
                  ),
                  buildFloatingSearchBar(),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  getUserCurrentLocation().then((value) async {
                    CameraPosition cameraPosition = new CameraPosition(
                      target: LatLng(value.latitude, value.longitude),
                      zoom: 14,
                    );
                    final GoogleMapController controller =
                        await _controller.future;
                    controller.animateCamera(
                        CameraUpdate.newCameraPosition(cameraPosition));
                    setState(() {});
                  });
                },
                child: const Icon(Icons.place),
              ),
            );
          },
        ));
  }
}
