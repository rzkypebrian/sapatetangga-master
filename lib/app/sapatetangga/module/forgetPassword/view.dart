import 'package:enerren/app/sapatetangga/module/forgetPassword/presenter.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/InputComponent.dart';
// import 'package:enerren/component/BottonComponent.dart';
// import 'package:enerren/component/InputComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BottonComponent.customAppBar1(
        context: context,
        actionText: "",
        title: "Lupa Kata Sandi",
        backgroundColor: Color(0xff084A9A),
        titleColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            )
          ],
        ),
        height: 200,
        margin: EdgeInsets.only(top: 20),
        child: Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Email",
                  style: System.data.textStyleUtil.mainLabel(
                    color: Color(0xff084A9A),
                  ),
                ),
              ),
              Container(
                child: InputComponent.inputTextWithUnderLine(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottonComponent.mainBotton(
        text: "Kirim",
        onTap: null,
        backgroundColor: Color(0xff084A9A),
        textStyle: System.data.textStyleUtil.mainLabel(
          color: Colors.white,
        ),
        cornerRadius: 0,
        borderColor: Colors.transparent
      ),
    );
  }
}
