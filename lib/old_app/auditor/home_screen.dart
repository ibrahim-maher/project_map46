import 'package:flutter/material.dart';
import 'package:project_map/old_app/auditor/view_detials.dart';

class HomeScreen extends StatelessWidget {

  static const String routName = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Requests",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.withOpacity(.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Doctor 1",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Department :",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Text("skin")
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Location :",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Text("\n183 zakaria Ghoneim Street,\nSpoeting")
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).pushNamed(DetailsScreen.routName);
                            },
                            label: const Text(
                              "View Detials",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            icon: const Icon(Icons.arrow_right),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent),

                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

    );
  }
}
