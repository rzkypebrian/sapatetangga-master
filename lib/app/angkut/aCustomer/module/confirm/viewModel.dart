import 'package:enerren/app/angkut/model/AngkutShipmentModel.dart';
import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  AngkutShipmentModel shipment = new AngkutShipmentModel();

  CircularProgressIndicatorController loadingController =
      new CircularProgressIndicatorController();

  int currentIndex = 0;
  bool showDetailInsurance = false;

  void personInCharge(int index) {
    if (index == 0) {
      shipment.payerName =
          shipment.tmsShipmentDestinationList.first.originContactPerson;
      shipment.payerPhoneNo =
          shipment.tmsShipmentDestinationList.first.originContactNumber;
    } else if (index == 1) {
      shipment.payerName =
          shipment.tmsShipmentDestinationList.first.destinationContactPerson;
      shipment.payerPhoneNo =
          shipment.tmsShipmentDestinationList.first.destinationContactNumber;
    }
    currentIndex = index;
    commit();
  }

  void commit() {
    notifyListeners();
  }
}
