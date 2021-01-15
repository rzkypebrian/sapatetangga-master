import 'package:enerren/app/sapatetangga/module/listReport/presenter.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BottonComponent.customAppBar1(
          context: context,
          actionText: "",
          title: "Daftar Laporan",
          backgroundColor: Color(0xff084A9A),
          titleColor: Colors.white,
          rightWidget: Container(
            padding: EdgeInsets.only(right: 10),
            child: SvgPicture.asset("assets/sapatetangga/icon_add_report.svg"),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => gotoDetailListReport(context),
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  height: 80,
                  padding: EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 240, top: 10),
                        child: Text("10 Juni 2020 08:00"),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        child: Text(
                          "Terjadinya banjir di perumahan B",
                          style: System.data.textStyleUtil.mainLabel(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                height: 80,
                padding: EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 240, top: 10),
                      child: Text("03 Juni 2020 12:30"),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Container(
                      child: Text(
                        "Pohon tumbang di perumahan A",
                        style: System.data.textStyleUtil.mainLabel(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
