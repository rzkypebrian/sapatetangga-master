import 'package:enerren/app/sapatetangga/module/dashboard/presenter.dart';
import 'package:enerren/util/SystemUtil.dart';
// import 'package:enerren/component/BottonComponent.dart';
// import 'package:enerren/component/InputComponent.dart';
// import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 683,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                    left: 30,
                    right: 30,
                  ),
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset("assets/sapatetangga/icon_itb.svg"),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 55,
                    left: 90,
                  ),
                  child: Text(
                    "LPPM-ITB",
                    style: System.data.textStyleUtil.mainLabel(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: System.data.fontUtil.l),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                    left: 350,
                  ),
                  height: 40,
                  width: 40,
                  child:
                      SvgPicture.asset("assets/sapatetangga/icon_setting.svg"),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 110, left: 30, right: 200),
                  child: Text(
                    "Hai pak Ahmad, selamat datang di aplikasi Sapa Diri & Tetangga desa Cikalong.",
                    style: System.data.textStyleUtil
                        .mainLabel(color: Colors.white),
                  ),
                ),
                Container(
                  height: 380,
                  width: 180,
                  margin: EdgeInsets.only(
                    top: 100,
                    left: 240,
                  ),
                  child: SvgPicture.asset("assets/sapatetangga/icon_man.svg"),
                ),
                Container(
                  color: Colors.white,
                  height: 500,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 270),
                ),
                GestureDetector(
                  onTap: () => gotoFamily(context),
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
                    height: 90,
                    margin: EdgeInsets.only(
                      top: 240,
                      left: 50,
                      right: 50,
                    ),
                    child: SvgPicture.asset(
                      "assets/sapatetangga/label_anggota.svg",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => gotoDataFamily(context),
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
                    height: 90,
                    margin: EdgeInsets.only(
                      top: 320,
                      left: 50,
                      right: 50,
                    ),
                    child: SvgPicture.asset(
                      "assets/sapatetangga/label_data.svg",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => gotoMap(context),
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
                    height: 90,
                    margin: EdgeInsets.only(
                      top: 400,
                      left: 50,
                      right: 50,
                    ),
                    child: SvgPicture.asset(
                      "assets/sapatetangga/label_peta.svg",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => gotoReport(context),
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
                    height: 90,
                    margin: EdgeInsets.only(
                      top: 480,
                      left: 50,
                      right: 50,
                    ),
                    child: SvgPicture.asset(
                      "assets/sapatetangga/label_lapor.svg",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => gotoInformation(context),
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
                    height: 90,
                    margin: EdgeInsets.only(
                      top: 560,
                      left: 50,
                      right: 50,
                    ),
                    child: SvgPicture.asset(
                      "assets/sapatetangga/label_informasi.svg",
                      fit: BoxFit.fitHeight,
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
