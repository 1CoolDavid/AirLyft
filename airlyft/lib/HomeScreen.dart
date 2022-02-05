import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:convert';
import './LoginScreen.dart';
import "./PaymentScreen.dart";
import "./LuggageScreen.dart";
import 'package:http/http.dart' as http;
import 'dart:async';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfbefd9),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 45.0),
                width: 350.0,
                height: 700.0,
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Hey Gaurang",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          color: Color(0xFF5D5B56),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Let’s get you a Carrier and make your journey delightful! ",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color(0xFF5D5B56),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: MemoryImage(base64Decode(planeImage)),
                              fit: BoxFit.fill),
                        ),
                        width: 230,
                        height: 160,
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Enter your flight number",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xFF5D5B56),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 35.0),
                      child: TextField(
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          hintText: "",
                          fillColor: Color(0xFFfbefd9),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Book a carrier on arrival?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xFF5D5B56),
                        ),
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                      child: DropdownButton<String>(
                        items: <String>["Yes", "No"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: "Yes",
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 0.0),
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF5D5B56)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: Color(0xFFFBEFD9))))),
                          onPressed: () {
                            FlightApiCall();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LuggageScreen()));
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 55.0),
                              child: Text('Next',
                                  style: TextStyle(
                                      color: Color(0xFFFBEFD9),
                                      fontSize: 20.0)))))
                ]))));
  }

  void FlightApiCall() {}
}

final String planeImage =
    "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";
