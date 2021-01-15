import 'package:enerren/app/sapatetangga/module/login/view.dart';
import 'package:enerren/app/sapatetangga/module/login/viewModel.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/util/ModeUtil.dart';
// import 'package:enerren/util/ModeUtil.dart';
import 'package:flutter/material.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final String noKk;
  final String password;
  final VoidCallback onSubmit;
  final VoidCallback onSuccess;

  const Presenter({
    Key key,
    this.view,
    this.noKk,
    this.password,
    this.onSubmit,
    this.onSuccess,
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
  ViewModel model;
  final CircularProgressIndicatorController controller =
      new CircularProgressIndicatorController();
  InputComponentTextEditingController noKkController =
      new InputComponentTextEditingController();
  FocusNode noKkFocusNode = new FocusNode();
  InputComponentTextEditingController passwordController =
      new InputComponentTextEditingController();
  FocusNode passwordFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  bool validateNoKk() {
    if (noKkController.text.isEmpty) {
      noKkController.setStateInput = StateInput.Error;
      return false;
    } else {
      noKkController.setStateInput = StateInput.Enable;
      return null;
    }
  }

  bool validatePassword() {
    if (passwordController.text.isEmpty) {
      passwordController.setStateInput = StateInput.Error;
      return false;
    } else {
      passwordController.setStateInput = StateInput.Enable;
      return null;
    }
  }

  bool validate() {
    bool isValid = true;
    isValid = validateNoKk() ?? isValid;
    isValid = validatePassword() ?? isValid;
    return isValid;
  }

  void submit() {
    if (!validate()) return;
    if (noKkController.text == "3205382312071863" &&
        passwordController.text == "1234") {
          if(widget.onSuccess != null){
            widget.onSuccess();
          }
        } else{
          ModeUtil.debugPrint("No. KK dan Password salah");
        }
  }
}
