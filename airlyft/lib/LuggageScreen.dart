import 'package:airlyft/CarrierScreen.dart';
import 'package:airlyft/MeetingInformationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LuggageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfbefd9),
        body: SingleChildScrollView(
            child: Container(
                width: 350.0,
                height: 610.0,
                margin: EdgeInsets.only(top: 65.0, left: 30.0),
                child: Column(
                  children: [
                    Container(
                        width: 400,
                        padding: EdgeInsets.only(top: 0.0, bottom: 20),
                        child: Text(
                          "Confirm your details",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 37.0,
                            color: Color(0xFF5D5B56),
                          ),
                        )),
                    Container(
                        width: 350.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3AD7A),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(31.0)),
                        ),
                        child: Row(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(top: 30.0, left: 40),
                                  child: Text(
                                    "From ",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(top: 10.0, left: 40),
                                  child: Text(
                                    "Airport ",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(top: 30.0, left: 40),
                                  child: Text(
                                    "To ",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(top: 10.0, left: 40),
                                  child: Text(
                                    "Airport ",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.only(top: 33.0, left: 30.0),
                                  child: Text(
                                    "New York City, NY",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.only(top: 16.0, left: 30.0),
                                  child: Text(
                                    "JFK",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.only(top: 34.0, left: 30.0),
                                  child: Text(
                                    "Pittsburgh, PA",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.only(top: 15.0, left: 30.0),
                                  child: Text(
                                    "PIT",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                            ],
                          )
                        ])),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        width: 350,
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 15.0, left: 0, bottom: 10),
                                child: Text(
                                  "Number of bags:",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Color(0xFF5D5B56),
                                  ),
                                )),
                            Row(children: [
                              Flexible(
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ], // Only numbers can be entered
                              )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.only(top: 0.0, left: 30.0),
                                  child: Text(
                                    "bags     ",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                            ])
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 10.0, left: 5.0),
                        width: 350,
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 15.0, left: 0, bottom: 10),
                                child: Text(
                                  "Approx weight of all bags combined:",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Color(0xFF5D5B56),
                                  ),
                                )),
                            Row(children: [
                              Flexible(
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ], // Only numbers can be entered
                              )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.only(top: 0.0, left: 30.0),
                                  child: Text(
                                    "lbs        ",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Color(0xFF5D5B56),
                                    ),
                                  )),
                            ])
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
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
                                  builder: (context) =>
                                      MeetingInformationScreen()));
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 90.0),
                                child: Text('Next',
                                    style: TextStyle(
                                        color: Color(0xFFFBEFD9),
                                        fontSize: 20.0)))))
                  ],
                ))));
  }
}
