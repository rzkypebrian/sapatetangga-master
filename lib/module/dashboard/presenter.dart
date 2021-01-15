import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/model/profileModel.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'view.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final VoidCallback gotoProfile;

  const Presenter({Key key, this.view, this.gotoProfile}) : super(key: key);

  createState() {
    if (view != null) {
      return view;
    } else {
      return View();
    }
  }
}

abstract class PresenterState extends State<Presenter> {
  var tick = 1;
  var profile = ProfileModel.dummy();

  CircularProgressIndicatorController loadingController =
      new CircularProgressIndicatorController();
  FlareController flare1;

  @override
  void initState() {
    super.initState();
    loadingController.stopLoading();
  }

  void gotoProfile(BuildContext context) {
    if (widget.gotoProfile != null) {
      widget.gotoProfile();
    }
  }
}
