import 'package:enerren/app/sapatetangga/module/editDatafamily/view.dart';
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
    if (view != null){
      return view;
    } else{
      return View();
    }
  }
}

abstract class PresenterState extends State<Presenter> {

  InputComponentTextEditingController inputAlamat = new InputComponentTextEditingController();

  InputComponentTextEditingController noRumah = new InputComponentTextEditingController();
  
  InputComponentTextEditingController listrik = new InputComponentTextEditingController();

  InputComponentTextEditingController airMinum = new InputComponentTextEditingController();

  InputComponentTextEditingController internet = new InputComponentTextEditingController();

  InputComponentTextEditingController airBuangan = new InputComponentTextEditingController();

  InputComponentTextEditingController bahanBakarMasak = new InputComponentTextEditingController();

  InputComponentTextEditingController airCuci = new InputComponentTextEditingController();

  InputComponentTextEditingController telepon = new InputComponentTextEditingController();

  @override

  void initState(){
    super.initState();
  }
}
