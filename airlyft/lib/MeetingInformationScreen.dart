import 'package:airlyft/Data-Manager/locator.dart';
import 'package:airlyft/LuggageScreen.dart';
import 'package:airlyft/MapsWidget.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
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
                  imageData: ((context.watch<AppModel>().request?.userImHere1)!)
                      ? (context.watch<AppModel>().request?.carrier2!.photo)!
                      : (context.watch<AppModel>().request?.carrier1!.photo)!,
                  name: ((context.watch<AppModel>().request?.userImHere1)!)
                      ? (context.watch<AppModel>().request?.carrier2!.name)!
                      : (context.watch<AppModel>().request?.carrier1!.name)!,
                  phone: ((context.watch<AppModel>().request?.userImHere1)!)
                      ? (context.watch<AppModel>().request?.carrier2!.mobile)!
                      : (context.watch<AppModel>().request?.carrier1!.mobile)!,
                  age: ((context.watch<AppModel>().request?.userImHere1)!)
                      ? (context.watch<AppModel>().request?.carrier2!.age)!
                          .toString()
                      : (context.watch<AppModel>().request?.carrier1!.age)!
                          .toString(),
                  price: (context.watch<AppModel>().request?.price)!.toString(),
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
}
