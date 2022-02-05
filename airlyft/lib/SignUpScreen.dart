import 'package:airlyft/CarrierScreen.dart';
import 'package:airlyft/meetingTimeScreen.dart';
import 'package:flutter/material.dart';
import './HomeScreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFfbefd9),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 45.0),
                width: 350.0,
                height: 610.0,
                decoration: BoxDecoration(
                  color: Color(0xFF5D5B56),
                  borderRadius: BorderRadius.all(const Radius.circular(31.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            color: Color(0xFFFBEFD9),
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Enter Your Full Name                                  ",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFFFBEFD9),
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 35.0),
                        height: 80,
                        child: TextField(
                          style: TextStyle(fontSize: 20),
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
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Enter your email                                          ",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFFFBEFD9),
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 35.0),
                        height: 80,
                        child: TextField(
                          style: TextStyle(fontSize: 20),
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
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Enter a password                                         ",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFFFBEFD9),
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 35.0),
                        height: 80,
                        child: TextField(
                          style: TextStyle(fontSize: 20),
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
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Confirm your password                              ",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFFFBEFD9),
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 35.0),
                        height: 80,
                        child: TextField(
                          style: TextStyle(fontSize: 20),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 35.0),
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF5D5B56)),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                                color: Color(0xFFFBEFD9))))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 55.0),
                                child: Text('Sign Up',
                                    style: TextStyle(color: Color(0xFFFBEFD9), fontSize: 20.0)))))
                  ],
                ))));
  }
}
