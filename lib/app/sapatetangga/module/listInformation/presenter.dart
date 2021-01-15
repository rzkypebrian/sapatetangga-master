import 'package:enerren/app/sapatetangga/module/listInformation/view.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:flutter/material.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final VoidCallback gotoDetailListInformation;

  const Presenter({
    Key key,
    this.view, this.gotoDetailListInformation,
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

  InputComponentTextEditingController noKkController = new InputComponentTextEditingController();

  InputComponentTextEditingController passwordController = new InputComponentTextEditingController();
  
  @override

  void initState(){
    super.initState();
  }

  void gotoDetailListInformation(BuildContext context){
    if(widget.gotoDetailListInformation != null){
      widget.gotoDetailListInformation();
    }
  }
}
