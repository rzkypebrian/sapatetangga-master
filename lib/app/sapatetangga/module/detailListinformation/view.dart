import 'package:enerren/app/sapatetangga/module/detailListinformation/presenter.dart';
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
          title: "Informasi",
          backgroundColor: Color(0xff084A9A),
          titleColor: Colors.white,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 180,
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
                        "Terjadi pemadaman listrik di Desa Cikalong pada tanggal 14 Juni 2020 pada pukul 15:00. Karena adanya kerusakan di Gardu 3. Mohon perhatiannya kepada seluruh masyarakat Desa Cikalong untuk mempersiapkan segala kebutuhannya",
                        style: System.data.textStyleUtil.mainLabel(
                        ),
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
