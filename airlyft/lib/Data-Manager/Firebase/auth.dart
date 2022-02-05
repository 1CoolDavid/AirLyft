import 'dart:async';
import 'package:airlyft/Data-Manager/Firebase/real_database.dart';
import 'package:airlyft/Data-Manager/Models/AppModel.dart';
import 'package:airlyft/Data-Manager/Structures/customer.dart';
import 'package:airlyft/Data-Manager/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future<String?> register(
      String email, String password, String name) async {
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
    if (user != null) {
      Customer customer = Customer(name.substring(0, name.indexOf(" ")),
          name.substring(name.indexOf(" ") + 1), user.uid);
      await Database.setCustomer(customer).then((value) {
        if (value) {
          locator.get<AppModel>().updateCustomer(customer);
        } else {
          return null;
        }
      });
    }
    return user?.uid;
  }

  static Future<String?> signIn(String email, String password) async {
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    if (user != null) {
      Customer? customer = await Database.getCustomer(user.uid)
          .then((value) => value)
          .onError((error, stackTrace) {
        print(stackTrace);
        return null;
      });
      locator.get<AppModel>().updateCustomer(customer);
      return customer?.uid;
    }
    return null;
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
