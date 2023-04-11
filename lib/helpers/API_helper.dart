import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/clinic_model.dart';
import '../models/doctors_model.dart';

class API_helper{

  getDoctors(id ) async {

    try{

      var url = 'http://192.168.1.4:8000/api/DistanceBetweenCoordinate/1'; // Replace with your phpMyAdmin URL
      var headers = {
        'accept': 'application/json',
        'content-Type': 'application/json'};
      print("dddddddddddddddddddddobject");

      var response = await http.get(Uri.parse(url), headers: headers, );
      print("dddddddddddddddddddddobject");
      if (response.statusCode == 200) {
        print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

        List data = json.decode(response.body)['doctors'];
        print(data);
        print(data.map((doctor) => DoctorModel.fromJson(doctor)).toList());
        return data.map((doctor) => DoctorModel.fromJson(doctor)).toList();
      } else {
        print('Errooooooooooooor: ${response.reasonPhrase}');
      }
    }
    catch(e){
      print(e);
    }


  }


  getClinics(id ) async {

    try{
      var url = 'http://192.168.1.4:8000/api/DistanceBetweenCoordinate/1'; // Replace with your phpMyAdmin URL
      var headers = {
        'accept': 'application/json',
        'content-Type': 'application/json'};
      print("dddddddddddddddddddddobject");

      var response = await http.get(Uri.parse(url), headers: headers, );
      print("dddddddddddddddddddddobject");
      if (response.statusCode == 200) {
        print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

        List data = json.decode(response.body)['clinics'];
        print(data);
        print(data.map((clinic) => ClinicalModel.fromJson(clinic)).toList());
        return data.map((clinic) => ClinicalModel.fromJson(clinic)).toList();
      } else {
        print('Errooooooooooooor: ${response.reasonPhrase}');
      }
    }
    catch(e){
      print(e);
    }


  }


  SearchForDoctor(String name) async {

    try{

      var url = 'http://192.168.1.4:8000/api/DistanceBetweenCoordinate/1'; // Replace with your phpMyAdmin URL
      var headers = {
        'accept': 'application/json',
        'content-Type': 'application/json'};
      var response = await http.get(Uri.parse(url), headers: headers, );
      if (response.statusCode == 200) {

        List data = json.decode(response.body);
        print(data);
        print(data.map((doctor) => DoctorModel.fromJson(doctor)).toList());
        return data.map((doctor) => DoctorModel.fromJson(doctor)).toList();
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    }
    catch(e){
      print(e);
    }


  }

  SearchForClinic(String name) async {

    try{

      var url = 'http://192.168.1.4:8000/api/DistanceBetweenCoordinate/1'; // Replace with your phpMyAdmin URL
      var headers = {
        'accept': 'application/json',
        'content-Type': 'application/json'};
      var response = await http.get(Uri.parse(url), headers: headers, );
      if (response.statusCode == 200) {

        List data = json.decode(response.body);
        print(data);
        print(data.map((Clinic) => ClinicalModel.fromJson(Clinic)).toList());
        return data.map((Clinic) => ClinicalModel.fromJson(Clinic)).toList();
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    }
    catch(e){
      print(e);
    }


  }


}
