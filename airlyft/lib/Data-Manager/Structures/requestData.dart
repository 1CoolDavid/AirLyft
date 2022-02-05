import 'package:airlyft/Data-Manager/Structures/carrier.dart';

class RequestData {
  String userUid = "";
  String requestUid = "";
  String flightNumber = "";
  String flightAirline = "";
  bool bookCarrierForArrival = true;
  String fromAirportCity = "";
  String toAirportCity = "";
  String fromAirportCode = "";
  String toAirportCode = "";
  int checkNumBags = 0;
  int bagTotalWeight = 0;
  Carrier? carrier1 = null;
  Carrier? carrier2 = null;
  bool userImHere1 = false;
  bool userImHere2 = false;
  double price = 0;
}
