import 'package:enerren/app/angkut/model/AngkutUangJalanSummaryViewModel.dart';
import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  CircularProgressIndicatorController loadingController =
      new CircularProgressIndicatorController();

  AngkutUangJalanSummaryViewModel exspensesListView =
      new AngkutUangJalanSummaryViewModel();

  void commit() {
    notifyListeners();
  }
}
