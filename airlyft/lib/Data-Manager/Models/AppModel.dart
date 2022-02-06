import 'package:flutter/cupertino.dart';

import '../Structures/customer.dart';
import '../Structures/requestData.dart';

class AppModel extends ChangeNotifier {
  static Customer? currentCustomer =
      new Customer("firstName", "lastName", "uid");
  static RequestData? currentRequest = RequestData.basic();

  static String? toAirport = "";
  static String? fromAirport = "";

  updateCustomer(Customer? c) {
    currentCustomer = c;
    notifyListeners();
  }

  updateRequest(RequestData? c) {
    currentRequest = c;
    notifyListeners();
  }

  updateAirport(String? to, String? from) {
    toAirport = to;
    fromAirport = from;
    notifyListeners();
  }

  update() {
    notifyListeners();
  }

  Customer? get customer => currentCustomer;
  RequestData? get request => currentRequest;
}
