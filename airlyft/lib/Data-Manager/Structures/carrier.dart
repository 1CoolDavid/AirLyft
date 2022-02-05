import 'package:flutter/cupertino.dart';

class Carrier {
  String _name = "", _mobile = "", photo = "", _uid = "";
  DateTime _dob = DateTime.now();
  int _age = 0;

  Carrier(String name, String uid, String mobile, DateTime dob) {
    _name = name;
    _mobile = mobile;
    _uid = uid;
    _dob = dob;
    DateTime now = DateTime.now();
    int years = now.year - dob.year;
    int months = now.month - dob.month;
    int days = now.day - dob.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
    }

    _age = years;
  }

  String get name => _name;

  String get mobile => _mobile;

  int get age => _age;

  String get uid => _uid;

  DateTime get dob => _dob;

  Map<String, dynamic> toJson() => {
        "name": _name,
        "mobile": _mobile,
        "uid": _uid,
        "photoURL": photo,
        "dob": _dob.toString(),
      };

  Carrier.fromJson(Map<String, dynamic> json) {
    _name = json["name"];
    _mobile = json["mobile"];
    _dob = DateTime.parse(json["mobile"]);
    photo = json["photoURL"];
    _uid = json["uid"];
  }
}
