import 'package:enerren/app/sapatetangga/module/detailFamily/presenter.dart';
import 'package:enerren/component/BottonComponent.dart';
// import 'package:enerren/component/BottonComponent.dart';
// import 'package:enerren/component/InputComponent.dart';
// import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BottonComponent.customAppBar1(
          context: context,
          actionText: "",
          title: "Status Anggota",
          backgroundColor: Color(0xff084A9A),
          titleColor: Colors.white,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: ()=> gotoDetailFamilyMember(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey[350],
                          spreadRadius: (-8),
                          blurRadius: 10,
                          offset: Offset(4, 1)),
                    ],
                  ),
                  height: 110,
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: SvgPicture.asset(
                    "assets/sapatetangga/label_familyMember.svg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()=> gotoDetailNonFamilyMember(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey[350],
                          spreadRadius: (-8),
                          blurRadius: 10,
                          offset: Offset(4, 1)),
                    ],
                  ),
                  height: 110,
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: SvgPicture.asset(
                    "assets/sapatetangga/label_familyNonmember.svg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
