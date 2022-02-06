import 'package:airlyft/LuggageScreen.dart';
import 'package:airlyft/MeetingTimeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CarrierCard.dart';
import 'PaymentScreen.dart';
import 'package:airlyft/Data-Manager/Models/AppModel.dart';
import 'package:provider/provider.dart';

class CarrierScreen extends StatelessWidget {
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
                    padding: EdgeInsets.only(top: 50.0),
                    child: Text(
                      "Your Carriers",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Color(0xFF5D5B56),
                      ),
                    )),
                Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 10),
                    width: 400,
                    child: Text(
                      (context.watch<AppModel>().request?.fromAirportCity)!,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Color(0xFF5D5B56),
                      ),
                    )),
                CarrierCard(
                  imageData:
                      (context.watch<AppModel>().request?.carrier1!.photo)!,
                  name: (context.watch<AppModel>().request?.carrier1!.name)!,
                  phone: (context.watch<AppModel>().request?.carrier1!.mobile)!,
                  age: (context.watch<AppModel>().request?.carrier1!.age)!
                      .toString(),
                  price: (context.watch<AppModel>().request?.price)!.toString(),
                ),
                Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    )),
                Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 10),
                    width: 400,
                    child: Text(
                      (context.watch<AppModel>().request?.toAirportCity)!,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Color(0xFF5D5B56),
                      ),
                    )),
                CarrierCard(
                  imageData:
                      (context.watch<AppModel>().request?.carrier2!.photo)!,
                  name: (context.watch<AppModel>().request?.carrier2!.name)!,
                  phone: (context.watch<AppModel>().request?.carrier2!.mobile)!,
                  age: (context.watch<AppModel>().request?.carrier2!.age)!
                      .toString(),
                  price: (context.watch<AppModel>().request?.price)!.toString(),
                ),
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
                              builder: (context) => PaymentScreen()));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 90.0),
                            child: Text('Next',
                                style: TextStyle(
                                    color: Color(0xFFFBEFD9),
                                    fontSize: 20.0)))))
              ],
            )));
  }
}
