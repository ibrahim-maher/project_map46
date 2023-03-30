// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';


AlertDialog details_dialog(name,nameDepartment,price,id) {

  return AlertDialog(
    title: Text(name,style: const TextStyle(
      color: Colors.blue,
    ),),
    content:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(nameDepartment),
        Text("Price $price\$"),
      ],
    ),

    actions: [
      ElevatedButton(
          onPressed: () {
            Get.toNamed('/doctor_profile', arguments: id);
          },
          child: const Text('View Profile')
      ),
      const SizedBox(width: 70,),
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Cancel'),
      ),
    ],
  );
}
