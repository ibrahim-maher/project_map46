

import 'package:flutter/material.dart';

class TabMarker extends StatelessWidget {
  const TabMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    "Name doctor",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {}, child: Text("profile"))
              ],
            ),
          ),
          Padding(
              padding:
              EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Appointment Booking"),
              ))
        ],
      ),
    );
  }
}
