import 'package:airlyft/Data-Manager/locator.dart';
import 'package:airlyft/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:airlyft/Data-Manager/Models/AppModel.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import "package:airlyft/MainScreen.dart";

Future<void> main() async {
  // runApp(ChangeNotifierProvider(create: (_) => null, child: const MyApp()));
  runApp(ChangeNotifierProvider(
    create: (context) => AppModel(),
    child: MyApp(),
  ));
  setUpLocator();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51JT7jkCTAUDjRNFVfafy4Gskx1KzUNk8nPj8T51zzCPE18fA17DOFO6MqSZVTCxhVCSWGwouDSe0yjcObAznHLW600VBoGyDcg";
  await Stripe.instance.applySettings();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
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
          primarySwatch: Colors.blue,
        ),
        home: LogSign()); //LogSign();
  }
}

void gotoLuggageInfoScreen(BuildContext context) {}
