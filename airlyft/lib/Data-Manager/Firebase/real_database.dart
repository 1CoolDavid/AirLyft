import 'dart:convert';

import 'package:airlyft/Data-Manager/Structures/carrier.dart';
import 'package:airlyft/Data-Manager/Structures/customer.dart';
import 'package:airlyft/Data-Manager/Structures/requestData.dart';
import 'package:airlyft/Data-Manager/locator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';

class Database {
  static Future<Customer?> getCustomer(String id) async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = database.ref("customers/$id");

    Object? customer = await ref.once().then((event) {
      if (event.snapshot.exists) {
        return event.snapshot.value;
      } else {
        return null;
      }
    });

    if (customer == null) return null;
    Customer c = Customer.fromJson(jsonDecode(jsonEncode(customer)));
    print(c.firstName);
    return c;
  }

  static Future<Carrier?> getCarrier(String id) async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = database.ref().child("carriers/$id");

    Carrier? carrier = await ref.once().then((event) {
      if (event.snapshot.exists) {
        return Carrier.fromJson(event.snapshot.value as Map<String, dynamic>);
      } else {
        return null;
      }
    });

    return carrier;
  }

  static Future<RequestData?> getRequestData(String id) async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = database.ref().child("carriers/$id");

    Object? reqData = await ref.once().then((event) {
      if (event.snapshot.exists) {
        return event.snapshot.exists;
      } else {
        return null;
      }
    });

    if (reqData == null) return null;
    RequestData r = RequestData.fromJson(jsonDecode(jsonEncode(reqData)));

    return r;
  }

  static Future<bool> setCustomer(Customer customer) async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    String id = customer.uid;
    DatabaseReference ref = database.ref("customers/$id");

    return await ref
        .set(customer.toJson())
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  static Future<bool> setCarrier(Carrier carrier) async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    String id = carrier.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref("carrier/$id");

    return await ref
        .set(carrier.toJson())
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  static Future<String?> setRequest(RequestData req) async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    String uuid = Uuid().v1();
    DatabaseReference ref = database.ref("request/$uuid");
    req.requestUid = uuid;

    return await ref
        .set(req.toJson())
        .then((value) => uuid)
        .onError((error, stackTrace) => Future.value(null));
  }

  // static Future<bool> updateCustomer(Customer customer,) async {
  //   FirebaseDatabase database = FirebaseDatabase.instance;
  //   String id = customer.uid;
  //   DatabaseReference ref = FirebaseDatabase.instance.ref("customers/$id");

  //   return await ref.set(customer.toJson()).then((value) => true).onError((error, stackTrace) => false);
  // }

  // static Future<bool> updateCarrier(Carrier carrier) async {}
}
