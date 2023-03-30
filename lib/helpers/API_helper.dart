import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/doctors_model.dart';

class API_helper{

  getDoctors() async {

    var url = 'http://192.168.147.2/newfolder/index.php'; // Replace with your phpMyAdmin URL
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var response = await http.post(Uri.parse(url), headers: headers, );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print(data);
      return data.map((doctor) => DoctorModel.fromJson(doctor)).toList();
    } else {
      print('Error: ${response.reasonPhrase}');
    }

  }
}
