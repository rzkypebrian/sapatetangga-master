import 'package:enerren/app/sapatetangga/module/expandedDetailfamilymember/view.dart';
import 'package:flutter/material.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;

  const Presenter({
    Key key,
    this.view,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    if (view != null){
      return view;
    } else{
      return View();
    }
  }
}

abstract class PresenterState extends State<Presenter> {


  @override

  void initState(){
    super.initState();
  }
}
