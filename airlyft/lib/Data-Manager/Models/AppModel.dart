import 'package:flutter/cupertino.dart';

import '../Structures/customer.dart';

class AppModel extends ChangeNotifier {
  static Customer? currentCustomer;

  updateCustomer(Customer? c) {
    currentCustomer = c;
    notifyListeners();
  }

  Customer? get customer => currentCustomer;
}
