import 'package:flutter/material.dart';

class luggageInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Multi Page Application"),
        ),
        body: const Checkbox(
          value: false,
          onChanged: null,
          // onChanged: (bool newValue) {
          //   Navigator.push(
          //     ctxt,
          //     new MaterialPageRoute(builder: (ctxt) => new SecondScreen()),
          //   );
        ));
  }
}
