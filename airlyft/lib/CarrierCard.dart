import 'dart:convert';
import 'package:flutter/material.dart';

class CarrierCard extends StatelessWidget {
  CarrierCard(
      {Key? key,
      required this.imageData,
      required this.name,
      required this.age,
      required this.phone,
      required this.price})
      : super(key: key);
  final String imageData, name, age, phone, price;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350.0,
        height: 160.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(0, 243, 172, 122),
        ),
        child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Color(0xFFF3AD7A),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: MemoryImage(base64Decode(imageData)),
                            fit: BoxFit.fill),
                      ),
                      width: 120,
                      height: 120,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 25.0, left: 30.0),
                        child: Text(
                          "Name: " + name,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFF5D5B56),
                          ),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 15.0, left: 30.0),
                        child: Text(
                          "Age: " + age,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFF5D5B56),
                          ),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 15.0, left: 30.0),
                        child: Text(
                          "Phone: " + phone,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFF5D5B56),
                          ),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 15.0, left: 30.0),
                        child: Text(
                          "Price: " + price,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFF5D5B56),
                          ),
                        )),
                  ],
                )
              ],
            )));
  }
}
