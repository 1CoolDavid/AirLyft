import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Auth {
  static Future<int> register(
      String email, String password, String userName) async {
    User? creds = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((UserCredential authResult) {
      return authResult.user;
    }).catchError((error) => null);
    if (creds == null)
      return 0;
    else {
      return 0;
    }
  }

  static Future<String?> signIn(String email, String password) async {
    User? user;
    try {
      if (FirebaseAuth.instance != null) print("MAJOR PROBLEM");
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user);
    } on Exception catch (e) {
      print(e.toString());
    }

    // if (user == null) return null;
    //   Backend.User userRef = await FireStorer.getUserByUID(userCredential.user.uid).then((value) {
    //     return value;
    // }).catchError((error) {
    //   return null;
    // });
    // if (userRef == null)
    //   return null;
    // else
    //   setUser(userRef);
    // return userCredential.user.uid;
  }

  static Future<bool> changePassword(String newPassword) async {
    User? user = FirebaseAuth.instance.currentUser;
    return user == null
        ? Future.value(false)
        : user
            .updatePassword(newPassword)
            .then((void v) => true, onError: (error) => false);
  }

  static Future<bool> changeEmail(String newEmail) async {
    User? user = FirebaseAuth.instance.currentUser;
    return user == null
        ? Future.value(false)
        : user
            .updateEmail(newEmail)
            .then((void v) => true, onError: (error) => false);
  }

  static Future<User?> getCurrentFirebaseUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return currentUser;
  }

  static Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  static Future<void> forgotPasswordEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
