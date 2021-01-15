import 'package:enerren/app/sapatetangga/module/listReport/view.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:flutter/material.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final VoidCallback gotoDetailListReport;

  const Presenter({
    Key key,
    this.view, this.gotoDetailListReport,
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
  void gotoDetailListReport(BuildContext context){
    if(widget.gotoDetailListReport !=null){
      widget.gotoDetailListReport();
    }
}
}