import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:airlyft/SignUpScreen.dart';
import 'package:airlyft/LoginScreen.dart';

class LogSign extends StatelessWidget {
  const LogSign({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfbefd9),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 45.0),
            width: 350.0,
            height: 700.0,
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 70.0),
                    child: Text(
                      "AirLyft",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Color(0xFF5D5B56),
                      ),
                    )),
                Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Uber for airports",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        color: Color(0xFF5D5B56),
                      ),
                    )),
                Container(
                    padding: EdgeInsets.only(left: 20.0, top: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: MemoryImage(base64Decode(traveler)),
                            fit: BoxFit.fill),
                      ),
                      width: 250,
                      height: 180,
                    )),
                Container(
                    padding: EdgeInsets.only(top: 90.0),
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF5D5B56)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side:
                                        BorderSide(color: Color(0xFFFBEFD9))))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 90.0),
                            child: Text('Sign Up',
                                style: TextStyle(
                                    color: Color(0xFFFBEFD9),
                                    fontSize: 20.0))))),
                Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF5D5B56)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side:
                                        BorderSide(color: Color(0xFFFBEFD9))))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 90.0),
                            child: Text('  Login  ',
                                style: TextStyle(
                                    color: Color(0xFFFBEFD9),
                                    fontSize: 20.0)))))
              ],
            )));
  }

  final String traveler =
      "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";
}
