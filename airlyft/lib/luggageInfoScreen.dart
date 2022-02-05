import 'package:flutter/material.dart';

class luggageInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: AppBar(
          title: Text("More Luggage Information"),
        ),
        body: Column(
          children: <Widget>[
            Text(
              "How many luggages do you have?",
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter number of luggages",
              ),
            ),
            Text(
              "How heavy is your luggage?",
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter total weight in lbs",
              ),
            ),
          ],
        ));
  }
}
