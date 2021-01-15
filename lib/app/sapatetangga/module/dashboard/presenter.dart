import 'package:enerren/app/sapatetangga/module/dashboard/view.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:flutter/material.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final VoidCallback gotoFamily;
  final VoidCallback gotoDataFamily;
  final VoidCallback gotoMap;
  final VoidCallback gotoReport;
  final VoidCallback gotoInformation;

  const Presenter({
    Key key,
    this.view,
    this.gotoFamily,
    this.gotoDataFamily,
    this.gotoMap,
    this.gotoReport,
    this.gotoInformation,
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
  InputComponentTextEditingController noKkController =
      new InputComponentTextEditingController();

  InputComponentTextEditingController passwordController =
      new InputComponentTextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void gotoFamily(BuildContext context) {
    if (widget.gotoFamily != null) {
      widget.gotoFamily();
    }
  }

  void gotoDataFamily(BuildContext context) {
    if (widget.gotoDataFamily != null) {
      widget.gotoDataFamily();
    }
  }

  void gotoMap(BuildContext context) {
    if (widget.gotoMap != null) {
      widget.gotoMap();
    }
  }

  void gotoReport(BuildContext context) {
    if (widget.gotoReport != null) {
      widget.gotoReport();
    }
  }

  void gotoInformation(BuildContext context) {
    if (widget.gotoInformation != null) {
      widget.gotoInformation();
    }
  }
}
