import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  double lat;
  double lon;
  String address;
  String provinsi;
  String kecamatan;
  String kabupaten;
  String detailAdress;
  String name;
  String phoneNumber;

  ViewModel({
    this.lat,
    this.lon,
    this.address,
    this.provinsi,
    this.kecamatan,
    this.kabupaten,
    this.detailAdress,
    this.phoneNumber,
    this.name,
  });

  void commit() {
    notifyListeners();
  }
}
