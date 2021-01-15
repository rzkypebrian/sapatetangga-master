
import 'package:enerren/app/angkut/model/AngkutUangJalanSummaryViewModel.dart';
import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  TabController controller;
  int indexController = 0;
  AngkutUangJalanSummaryViewModel angkutBudgetOperationModel;
  List<AngkutUangJalanSummaryViewModel> listAngkutBudgetOperationModel = [];

  void addBudget() {
    listAngkutBudgetOperationModel.add(angkutBudgetOperationModel);
    commint();
  }

  void commint() {
    notifyListeners();
  }
}
