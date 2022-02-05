import 'dart:async';
import 'package:airlyft/Data-Manager/Firebase/real_database.dart';
import 'package:airlyft/Data-Manager/Structures/customer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future<String?> register(String email, String password) async {
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user?.uid;
  }

  static Future<String?> signIn(String email, String password) async {
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return user?.uid;
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
