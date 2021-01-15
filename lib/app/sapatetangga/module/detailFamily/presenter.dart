import 'package:enerren/app/sapatetangga/module/detailFamily/view.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:flutter/material.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final VoidCallback gotoDetailFamilyMember;
  final VoidCallback gotoDetailNonFamilyMember;

  const Presenter({
    Key key,
    this.view,
    this.gotoDetailFamilyMember, this.gotoDetailNonFamilyMember,
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

  void gotoDetailFamilyMember(BuildContext context) {
    if (widget.gotoDetailFamilyMember != null) {
      widget.gotoDetailFamilyMember();
    }
  }
  void gotoDetailNonFamilyMember(BuildContext context){
    if(widget.gotoDetailNonFamilyMember !=null){
      widget.gotoDetailNonFamilyMember();
    }
  }
}
