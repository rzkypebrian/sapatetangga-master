import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  String noKk;
  String password;

  ViewModel({
    this.noKk,
    this.password,
  });

  void copy(ViewModel model) {
    this.noKk = model.noKk;
    this.password = model.password;
  }

  void commit() {
    notifyListeners();
  }
}
