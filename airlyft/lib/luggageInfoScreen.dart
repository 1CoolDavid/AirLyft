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
              "How many bags do you have?", 
            ),
          ],
        ));
  }
}
