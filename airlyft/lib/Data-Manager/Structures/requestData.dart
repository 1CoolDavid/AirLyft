import 'dart:convert';

import 'package:airlyft/Data-Manager/Structures/carrier.dart';

class RequestData {
  String userUid = "userUid";
  String requestUid = "reqUid";
  String flightNumber = "123";
  String flightAirline = "United";
  String fromAirportCity = "San Francisco";
  String toAirportCity = "Pittsburgh";
  String fromAirportCode = "SFO";
  String toAirportCode = "PIT";
  int checkNumBags = 2;
  int bagTotalWeight = 100;
  Carrier? carrier1 =
      new Carrier("name", "uid", "123-546-7890", DateTime.now());
  Carrier? carrier2 =
      new Carrier("name", "uid", "123-546-7890", DateTime.now());
  bool userImHere1 = false;
  bool userImHere2 = false;
  double price = 10;

  RequestData.basic();

  RequestData(
      String uid,
      String rid,
      String flightnum,
      String airline,
      String fromCity,
      String toCity,
      String fromCode,
      String toCode,
      int bags,
      int bagWeight,
      Carrier carrierIn,
      Carrier carrierOut,
      bool imHere1,
      bool imHere2) {
    userUid = uid;
    requestUid = rid;
    flightNumber = flightnum;
    flightAirline = airline;
    fromAirportCity = fromCity;
    toAirportCity = toCity;
    toAirportCode = toCode;
    fromAirportCode = fromCode;
    checkNumBags = bags;
    bagTotalWeight = bagWeight;
    carrier1 = carrierIn;
    carrier2 = carrierOut;
    imHere1 = userImHere1;
    imHere2 = userImHere2;
    price = 0; //TODO: Algorithm
  }

  Map<String, dynamic> toJson() => {
        "userUid": userUid,
        "requestUid": requestUid,
        "flightNumber": flightNumber,
        "flightAirline": flightAirline,
        "fromAirportCity": fromAirportCity,
        "toAirportCity": toAirportCity,
        "fromAirportCode": fromAirportCode,
        "checkNumBags": checkNumBags,
        "bagTotalWeight": bagTotalWeight,
        "carrier1": carrier1?.toJson(),
        "carrier2": carrier2?.toJson(),
        "userImHere1": userImHere1,
        "userImHere2": userImHere2,
        "price": price,
      };

  RequestData.fromJson(Map<String, dynamic> json) {
    userUid = json["userUid"];
    requestUid = json["requestUid"];
    flightNumber = json["flightNumber"];
    flightAirline = json["flightAirline"];
    fromAirportCity = json["fromAirportCity"];
    toAirportCity = json["toAirportCity"];
    fromAirportCity = json["fromAirportCity"];
    fromAirportCode = json["fromAirportCode"];
    toAirportCode = json["toAirportCode"];
    checkNumBags = json["checkNumBags"];
    bagTotalWeight = json["bagWeight"];
    carrier1 = Carrier.fromJson(jsonDecode(json["carrier1"]));
    carrier2 = Carrier.fromJson(jsonDecode(json["carrier2"]));
    userImHere1 = json["userImHere1"] == true;
    userImHere2 = json["userImHere2"] == true;
  }
}
