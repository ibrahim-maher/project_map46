// To parse this JSON data, do
//
//     final distanceBetweenCoordinateModel = distanceBetweenCoordinateModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<List<DistanceBetweenCoordinateModel>> distanceBetweenCoordinateModelFromJson(String str) => List<List<DistanceBetweenCoordinateModel>>.from(json.decode(str).map((x) => List<DistanceBetweenCoordinateModel>.from(x.map((x) => DistanceBetweenCoordinateModel.fromJson(x)))));

String distanceBetweenCoordinateModelToJson(List<List<DistanceBetweenCoordinateModel>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class DistanceBetweenCoordinateModel {
  DistanceBetweenCoordinateModel({
    required this.dName,
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.clinicalName,
  });

  final String dName;
  final int id;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic distance;
  final String clinicalName;

  factory DistanceBetweenCoordinateModel.fromJson(Map<String, dynamic> json) => DistanceBetweenCoordinateModel(
    dName: json["DName"],
    id: json["id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    distance: json["distance"],
    clinicalName: json["Clinical_Name"],
  );

  Map<String, dynamic> toJson() => {
    "DName": dName,
    "id": id,
    "latitude": latitude,
    "longitude": longitude,
    "distance": distance,
    "Clinical_Name": clinicalName,
  };
}
