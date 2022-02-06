import 'package:airlyft/CarrierScreen.dart';
import 'package:airlyft/Data-Manager/Firebase/auth.dart';
import 'package:airlyft/Data-Manager/Structures/customer.dart';
import 'package:airlyft/meetingTimeScreen.dart';
import 'package:flutter/material.dart';
import './HomeScreen.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  bool validEmail(String value) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return regex.hasMatch(value);
  }

  String _email = "", _password = "", _confirmedPass = "", _name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
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
                            padding: const EdgeInsets.only(top: 30.0),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                                color: Color(0xFFFBEFD9),
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: const Text(
                              "Enter Your Full Name                                  ",
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
                                vertical: 15.0, horizontal: 35.0),
                            height: 80,
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
                                  return "This field is required";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) => _name = value as String,
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: const Text(
                              "Enter your email                                          ",
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
                                vertical: 15.0, horizontal: 35.0),
                            height: 80,
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
                            padding: const EdgeInsets.only(top: 8.0),
                            child: const Text(
                              "Enter a password                                         ",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: const Color(0xFFFBEFD9),
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 35.0),
                            height: 80,
                            child: TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
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
                            padding: const EdgeInsets.only(top: 8.0),
                            child: const Text(
                              "Confirm your password                              ",
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
                                vertical: 15.0, horizontal: 35.0),
                            height: 80,
                            child: TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
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
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) =>
                                  _confirmedPass = value as String,
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 35.0),
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF5D5B56)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            color: const Color(0xFFFBEFD9))))),
                                onPressed: () async {
                                  bool? data =
                                      _formKey.currentState?.validate();
                                  if (data == null || !data) {
                                    return;
                                  } else {
                                    FormState? state = _formKey.currentState;
                                    if (state != null) {
                                      state.save();
                                      if (_confirmedPass != _password) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Please make sure password and confirmation match")));
                                        return;
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Registration failed, please try again")));
                                      return;
                                    }
                                  }
                                  String? uid = await Auth.register(
                                          _email, _password, _name)
                                      .catchError((error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Registration failed, please try again")));
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
                                                "Registration failed, please try again")));
                                  }
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 55.0),
                                    child: const Text('Sign Up',
                                        style: TextStyle(color: Color(0xFFFBEFD9), fontSize: 20.0)))))
                      ],
                    )))));
  }
}
