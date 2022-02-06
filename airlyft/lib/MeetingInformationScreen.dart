import 'package:airlyft/LuggageScreen.dart';
import 'package:airlyft/MapsWidget.dart';
import 'package:flutter/material.dart';
import 'CarrierCard.dart';
import 'package:airlyft/Data-Manager/Models/AppModel.dart';
import 'package:provider/provider.dart';

class MeetingInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfbefd9),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 35.0),
            width: 350.0,
            height: 700.0,
            child: Column(
              children: <Widget>[
                Container(
                    width: 400,
                    padding: EdgeInsets.only(top: 50.0, bottom: 20),
                    child: Text(
                      "Meeting Information",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Color(0xFF5D5B56),
                      ),
                    )),
                CarrierCard(
                  imageData: (image2),
                  name: "Robert",
                  phone: "129-624-195",
                  age: "39",
                  price: "4.00",
                ),
                Container(
                    padding: EdgeInsets.only(top: 20.0), child: MapsWidget()),
                Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                      "Carrier is arriving in 5 mins",
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
                              builder: (context) =>
                                  LuggageScreen("", "", "", "")));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 90.0),
                            child: Text("I'm here",
                                style: TextStyle(
                                    color: Color(0xFFFBEFD9),
                                    fontSize: 20.0))))),
              ],
            )));
  }

  final String image2 =
      "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";
}
