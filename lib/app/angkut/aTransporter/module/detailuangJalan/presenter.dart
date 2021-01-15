
import 'package:enerren/app/angkut/model/AngkutUangJalanSummaryViewModel.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final AngkutUangJalanSummaryViewModel angkutBudgetOperationModel;

  const Presenter({
    Key key,
    this.view,
    this.angkutBudgetOperationModel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    if (view != null) {
      return view;
    } else {
      return View();
    }
  }
}

abstract class PresenterState extends State<Presenter>
    with TickerProviderStateMixin {
  ViewModel data = ViewModel();

  @override
  void initState() {
    super.initState();
    data.controller = new TabController(vsync: this, length: 2)
      ..addListener(() {
        data.indexController = data.controller.index;
        data.commint();
      });
  }

  @override
  void dispose() {
    data.controller.dispose();
    super.dispose();
  }

  void detailVehicle(){}
}
