import 'package:enerren/app/angkut/model/AngkutShipmentModel.dart';
import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  AngkutShipmentModel shipment = new AngkutShipmentModel();
  bool showDetailInsurance = false;

  void commit() {
    notifyListeners();
  }
}
