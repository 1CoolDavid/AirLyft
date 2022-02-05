import 'dart:convert';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stripe Tutorial'),
        ),
        body: Center(
            child: InkWell(
          child: Container(
            height: 50,
            width: 200,
            color: Colors.green,
            child: Center(
              child: Text(
                'Pay',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        )));
  }
}
