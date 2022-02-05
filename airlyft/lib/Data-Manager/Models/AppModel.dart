import 'package:flutter/cupertino.dart';

import '../Structures/customer.dart';
import '../Structures/requestData.dart';

class AppModel extends ChangeNotifier {
  static Customer? currentCustomer;
  static RequestData? currentRequest;

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
