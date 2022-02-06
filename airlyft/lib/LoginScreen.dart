import 'package:airlyft/HomeScreen.dart';
import 'package:airlyft/LuggageScreen.dart';
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
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage('assets/logo-transparent.png'),
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            color: Color(0xFF3C3C3C),
                          ),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 35.0),
                        child: const Text(
                          "Enter your email                                  ",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFF3C3C3C),
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
                        padding: EdgeInsets.only(left: 35),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Enter your password                             ",
                          // ignore: unnecessary_const
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xFF3C3C3C),
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 35.0),
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
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 10, right: 10),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size.fromHeight(50)),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 248, 156, 103)),
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Login failed, please try again")));
                                  return;
                                }
                              }
                              String? uid = await Auth.signIn(_email, _password)
                                  .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Login failed")));
                              });
                              if (uid != null && uid.isNotEmpty) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Login failed, please try again")));
                              }
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 55.0),
                                child: const Text('Login', style: TextStyle(color: Color(0xFF3C3C3C), fontSize: 20.0))))),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Don't have an account? Click here to register!",
                          style: TextStyle(color: Color(0xFF3C3C3C)),
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
