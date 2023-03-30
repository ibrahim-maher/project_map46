import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String routName=("Detalis");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
     Row(
       mainAxisAlignment:   MainAxisAlignment.spaceAround,
       children: [
       ElevatedButton(
           style: ElevatedButton.styleFrom(
               backgroundColor: Colors.deepPurpleAccent),
           onPressed: (){}, child: const Text("Accept",style: TextStyle(fontSize: 20),),),
       const SizedBox(width: 3,),
       ElevatedButton(
           style: ElevatedButton.styleFrom(
               backgroundColor: Colors.deepPurpleAccent),
           onPressed: (){}, child: const Text("Decline",style: TextStyle(fontSize: 20))),
     ],),
    ],),);
  }
}
