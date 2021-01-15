import 'package:enerren/app/sapatetangga/module/addNewAccount/view.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:flutter/material.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;

  const Presenter({
    Key key,
    this.view,
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

abstract class PresenterState extends State<Presenter> {
  InputComponentTextEditingController addNewAccount =
      new InputComponentTextEditingController();

  @override
  void initState() {
    super.initState();
  }
}
