class Customer {
  String _firstName = "", _lastName = "", _uid = "";

  Customer(String firstName, String lastName, String uid) {
    _firstName = firstName;
    _lastName = lastName;
    _uid = uid;
  }

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get uid => _uid;

  Map<String, dynamic> toJson() => {
        "firstName": _firstName,
        "lastName": _lastName,
        "uid": _uid,
      };

  Customer.fromJson(Map<String, dynamic> json) {
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _uid = json["uid"];
  }
}
