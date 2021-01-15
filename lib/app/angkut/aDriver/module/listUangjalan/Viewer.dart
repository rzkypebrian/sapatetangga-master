 
import 'package:enerren/app/angkut/model/AngkutUangJalanSummaryViewModel.dart';
import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:flutter/material.dart';

class Viewer extends ChangeNotifier {
  CircularProgressIndicatorController loadingController =
      new CircularProgressIndicatorController();
  List<AngkutUangJalanSummaryViewModel> doModelList = []; 

  void commit(){
    notifyListeners();
  }
}
