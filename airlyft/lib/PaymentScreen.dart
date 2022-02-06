import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.

            ),
        home: PaymentPage());
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: const Color(0xFFfbefd9),
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF5D5B56)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: const BorderSide(color: Color(0xFFFBEFD9))))),
              onPressed: () async {
                await initPaymentSheet(context,
                    email: "example@gmail.com", amount: 2000);
              },
              child: const Text(
                'Complete payment',
                style: TextStyle(color: Color(0xFFfbefd9), fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
