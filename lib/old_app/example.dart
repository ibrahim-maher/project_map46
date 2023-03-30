import 'dart:typed_data';
import 'package:image/image.dart' as IMG;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget{
  static const String routName="home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map

  LatLng startLocation = const LatLng(27.6602292, 85.308027);
  LatLng endLocation = const LatLng(27.6599592, 85.3102498);

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  Uint8List? resizeImage(Uint8List data, width, height) {
    Uint8List? resizedData = data;
    IMG.Image? img = IMG.decodeImage(data);
    IMG.Image resized = IMG.copyResize(img!, width: width, height: height);
    resizedData = Uint8List.fromList(IMG.encodePng(resized));
    return resizedData;
  }

  addMarkers() async {


    String imgurl = "https://as2.ftcdn.net/v2/jpg/01/04/20/87/1000_F_104208777_WlKoButH3rxt9cI7RygFyWBjUi0qOpel.jpg";
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl))
        .load(imgurl))
        .buffer
        .asUint8List();

    Uint8List? smallimg = resizeImage(bytes, 150, 150);
    markers.add(
        Marker(
          markerId: MarkerId(startLocation.toString()),
          position: startLocation,
          icon: BitmapDescriptor.fromBytes(smallimg!), //Icon for Marker
        )
    );

    Uint8List? bigimg = resizeImage(bytes, 300, 300);
    markers.add(
        Marker(
          markerId: MarkerId(endLocation.toString()),
          position: endLocation,
          icon: BitmapDescriptor.fromBytes(bigimg!), //Icon for Marker
        )
    );

    setState(() {
      //refresh UI
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Resize Image Marker Icon Google Map"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: GoogleMap( //Map widget from google_maps_flutter package
          zoomGesturesEnabled: true, //enable Zoom in, out on map
          initialCameraPosition: CameraPosition( //innital position in map
            target: startLocation, //initial position
            zoom: 14.0, //initial zoom level
          ),
          markers: markers, //markers to show on map
          mapType: MapType.normal, //map type
          onMapCreated: (controller) { //method called when map is created
            setState(() {
              mapController = controller;
            });
          },
        )
    );
  }
}