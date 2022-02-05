import 'package:flutter/cupertino.dart';

class AirLyftProvider with ChangeNotifier {
  String name = "";
  String flightNumber = "";
  bool bookCarrierForArrival = true;
  String fromAirportCity = "";
  String toAirportCity = "";
  String fromAirportCode = "";
  String toAirportCode = "";
  int checkNumBags = 0;
  int bagTotalWeight = 0;
  String carrierName = "";
  String carrierAge = "";
  String carrierPhone = "";
  String carrierPrice = "";
  String carrierPicture = "";
  bool userImHere = false;

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setFlightNumber(String flightNumber) {
    this.flightNumber = flightNumber;
    notifyListeners();
  }

  void setBookCarrierForArrival(bool bookCarrierForArrival) {
    this.bookCarrierForArrival = bookCarrierForArrival;
    notifyListeners();
  }

  void setFromAirportCity(String fromAirportCity) {
    this.fromAirportCity = fromAirportCity;
    notifyListeners();
  }

  void setToAirportCity(String toAirportCity) {
    this.toAirportCity = toAirportCity;
    notifyListeners();
  }

  void setFromAirportCode(String fromAirportCode) {
    this.fromAirportCode = fromAirportCode;
    notifyListeners();
  }

  void setToAirportCode(String toAirportCode) {
    this.toAirportCode = toAirportCode;
    notifyListeners();
  }

  void setCheckNumBags(int checkNumBags) {
    this.checkNumBags = checkNumBags;
    notifyListeners();
  }

  void setBagTotalWeight(int bagTotalWeight) {
    this.bagTotalWeight = bagTotalWeight;
    notifyListeners();
  }

  void setCarrierName(String carrierName) {
    this.carrierName = carrierName;
    notifyListeners();
  }

  void setCarrierAge(String carrierAge) {
    this.carrierAge = carrierAge;
    notifyListeners();
  }

  void setCarrierPhone(String carrierPhone) {
    this.carrierPhone = carrierPhone;
    notifyListeners();
  }

  void setCarrierPrice(String carrierPrice) {
    this.carrierPrice = carrierPrice;
    notifyListeners();
  }

  void setCarrierPicture(String carrierPicture) {
    this.carrierPicture = carrierPicture;
    notifyListeners();
  }

  void setUserImHere(bool userImHere) {
    this.userImHere = userImHere;
    notifyListeners();
  }
}
