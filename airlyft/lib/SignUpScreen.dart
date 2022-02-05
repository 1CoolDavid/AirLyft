import 'package:airlyft/meetingTimeScreen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfbefd9),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 45.0),
            width: 350.0,
            height: 700.0,
            decoration: BoxDecoration(
              color: Color(0xFF5D5B56),
              borderRadius: BorderRadius.all(const Radius.circular(31.0)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 45.0),
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
                    padding: EdgeInsets.only(top: 50.0),
                    child: Text(
                      "Enter your email                                  ",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Color(0xFFFBEFD9),
                      ),
                    )),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
                    child: TextField(
                      style: TextStyle(fontSize: 7),
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
                    padding: EdgeInsets.only(top: 25.0),
                    child: Text(
                      "Enter a password                                ",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Color(0xFFFBEFD9),
                      ),
                    )),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
                    child: TextField(
                      style: TextStyle(fontSize: 7),
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
                      "Confirm your password                     ",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Color(0xFFFBEFD9),
                      ),
                    )),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
                    child: TextField(
                      style: TextStyle(fontSize: 7),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 40.0, horizontal: 35.0),
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF5D5B56)),
                            shape: MaterialStateProperty
                                .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side:
                                        BorderSide(color: Color(0xFFFBEFD9))))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MeetingTimeScreen()));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 55.0),
                            child: Text('Sign Up',
                                style: TextStyle(
                                    color: Color(0xFFFBEFD9),
                                    fontSize: 20.0)))))
              ],
            )));
  }
}
