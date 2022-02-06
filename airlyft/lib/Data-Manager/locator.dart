import 'package:airlyft/Data-Manager/Models/AppModel.dart';
import 'package:get_it/get_it.dart';

import 'Structures/customer.dart';

GetIt locator = GetIt.instance;
Customer? currentCustomer;

void setUpLocator() {
  locator.registerSingleton<AppModel>(AppModel());
}

void setCurrentCustomer(Customer? u) {
  currentCustomer = u;
}
