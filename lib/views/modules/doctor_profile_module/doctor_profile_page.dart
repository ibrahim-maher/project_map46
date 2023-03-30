// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_map/controllers/home_controller.dart';

class doctor_profilePage extends GetView<HomeController> {
  const doctor_profilePage({super.key});

  get arguments => Get.arguments;

  @override
  Widget build(BuildContext context) {
    var doctor =
        controller.doctors.firstWhere((element) => element.id == arguments);

    return Scaffold(
      appBar: AppBar(title: const Text('Doctor profile ')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ],
              ),
              child: doctor.photo != null
                  ? Image.network(
                      doctor.photo,
                      width: double.infinity,
                      height: 200,
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Center(child: Text('No photo'))),
            ),
            const SizedBox(height: 10) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  doctor.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' ${doctor.servicePrice}\$',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              doctor.nameDepartment,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10) ,
            const Text(
              'description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10) ,
            Text(
              doctor.description,
              style: const TextStyle(fontSize: 20,
                  overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10) ,
            const Text(
              'Phone',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10) ,
            Text(
              doctor.phoneNumber.toString(),
              style: const TextStyle(fontSize: 20),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: (){
                Get.toNamed('/view_distance');
                  controller.getPolyline(doctor.latitude, doctor.longitude);
                       print("dooooooooooooooooooooctor.latitude ${doctor.latitude}");
                }, child: const Text('View Distance')),
                ElevatedButton(onPressed: (){}, child: const Text('Book Now')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
