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
}
