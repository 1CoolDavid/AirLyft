import 'dart:convert';
import 'dart:developer';

import 'package:airlyft/LuggageScreen.dart';
import 'package:airlyft/MeetingInformationScreen.dart';
import 'package:airlyft/MeetingTimeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'CarrierCard.dart';
import 'PaymentScreen.dart';
import 'package:airlyft/Data-Manager/Models/AppModel.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CarrierScreen extends StatelessWidget {
  Future<void> initPaymentSheet(context,
      {required String email, required int amount}) async {
    try {
      // 1. create payment intent on the server
      final response = await http.post(
          Uri.parse(
              'https://us-central1-airlyft-8565f.cloudfunctions.net/stripePaymentIntentRequest'),
          body: {
            'email': email,
            'amount': amount.toString(),
          });

      final jsonResponse = jsonDecode(response.body);
      log(jsonResponse.toString());

      //2. initialize the payment sheet
      Stripe.publishableKey =
          "pk_test_51KPtH0FaVswPls9nGZBr9JvaKFQA4G3LB588Vv0dCQnA05Ou13eyTF2hRZMlW3H48gaFkI9XVDBeDDcV0OedjnIz002zY5Wwr3";
      await Stripe.instance.applySettings();
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Airlyft',
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
          style: ThemeMode.light,
          testEnv: true,
          merchantCountryCode: 'SG',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment completed!')),
      );
    } catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        print(e.toString());
      }
    }
  }

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
                        onPressed: () async {
                          await initPaymentSheet(context,
                              email: "example@gmail.com", amount: 2000);

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
            )));
  }
}
