import 'package:airlyft/HomeScreen.dart';
import 'package:airlyft/SignUpScreen.dart';
import 'package:airlyft/meetingTimeScreen.dart';
import 'package:flutter/material.dart';

import 'Data-Manager/Firebase/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();

bool validEmail(String value) {
  RegExp regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  return regex.hasMatch(value);
}

String _email = "", _password = "";

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFfbefd9),
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 35.0, horizontal: 45.0),
                width: 350.0,
                height: 610.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF5D5B56),
                  borderRadius: BorderRadius.all(Radius.circular(31.0)),
                ),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.only(top: 70.0),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                                color: Color(0xFFFBEFD9),
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 60.0),
                            child: const Text(
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 35.0),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                hintText: "",
                                fillColor: const Color(0xFFfbefd9),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This is a required field";
                                } else if (validEmail(value)) {
                                  return null;
                                } else {
                                  return "Please enter a valid email";
                                }
                              },
                              onSaved: (saved) => _email = saved as String,
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: const Text(
                              "Enter your password                             ",
                              // ignore: unnecessary_const
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Color(0xFFFBEFD9),
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 35.0),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                hintText: "",
                                fillColor: const Color(0xFFfbefd9),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This is a required field";
                                } else if (value.length < 8) {
                                  return "Password must be 8 characters or longer";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) => _password = value as String,
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF5D5B56)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: const BorderSide(
                                                color: Color(0xFFFBEFD9))))),
                                onPressed: () async {
                                  FormState? state = _formKey.currentState;
                                  if (state == null || !state.validate()) {
                                    return;
                                  } else {
                                    FormState? state = _formKey.currentState;
                                    if (state != null)
                                      state.save();
                                    else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Login failed, please try again")));
                                      return;
                                    }
                                  }
                                  String? uid =
                                      await Auth.signIn(_email, _password)
                                          .catchError((error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Login failed, please try again")));
                                  });
                                  if (uid != null && uid.isNotEmpty) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Login failed, please try again")));
                                  }
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 55.0),
                                    child: const Text('Login',
                                        style:
                                            TextStyle(color: Color(0xFFFBEFD9), fontSize: 20.0)))))
                      ],
                    )))));
  }
}
