import 'package:flutter/cupertino.dart';

import '../Structures/customer.dart';
import '../Structures/requestData.dart';

class AppModel extends ChangeNotifier {
  static Customer? currentCustomer =
      new Customer("firstName", "lastName", "uid");
  static RequestData? currentRequest = new RequestData();

  updateCustomer(Customer? c) {
    currentCustomer = c;
    notifyListeners();
  }

  updateRequest(RequestData? c) {
    currentRequest = c;
    notifyListeners();
  }

  Customer? get customer => currentCustomer;
  RequestData? get request => currentRequest;
}
