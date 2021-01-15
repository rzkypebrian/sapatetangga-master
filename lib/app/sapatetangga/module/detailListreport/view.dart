import 'package:enerren/app/sapatetangga/module/detailListReport/presenter.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';

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
        ),
        bottomNavigationBar: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 200),
                child: BottonComponent.roundedButton(
                    radius: 0,
                    text: "Edit",
                    colorBackground: Color(0xff084A9A),
                    textstyle: System.data.textStyleUtil.mainLabel(
                        fontWeight: FontWeight.bold,
                        color: System.data.colorUtil.lightTextColor,
                        fontSize: System.data.fontUtil.xl)),
              ),
              Container(
                padding: EdgeInsets.only(left: 200),
                child: BottonComponent.roundedButton(
                    border: Border.all(color: Color(0xff084A9A)),
                    radius: 0,
                    text: "Hapus",
                    colorBackground: Colors.white,
                    textstyle: System.data.textStyleUtil.mainLabel(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff084A9A),
                        fontSize: System.data.fontUtil.xl)),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 220,
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
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Isi",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Color(0xff084A9A),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Terjadinya banjir di perumahan B",
                        style: System.data.textStyleUtil.mainLabel(),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Tanggapan",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Color(0xff084A9A),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "-",
                        style: System.data.textStyleUtil.mainLabel(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
