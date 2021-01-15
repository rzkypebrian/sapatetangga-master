import 'package:enerren/app/sapatetangga/module/detailFamilymember/view.dart';
import 'package:flutter/material.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final tinggi;
  final VoidCallback gotoExpandedDetailFamilyMember;

  const Presenter({
    Key key,
    this.view,
    this.tinggi,
    this.gotoExpandedDetailFamilyMember,
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

  @override
  void initState() {
    super.initState();
  }

  void gotoExpandedDetailFamilyMember(BuildContext context) {
    if (widget.gotoExpandedDetailFamilyMember != null) {
      widget.gotoExpandedDetailFamilyMember();
    }
  }
}
