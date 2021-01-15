import 'package:enerren/app/sapatetangga/module/detailNonfamilymember/presenter.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
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
          title: "Anggota Non Keluarga",
          backgroundColor: Color(0xff084A9A),
          titleColor: Colors.white,
          rightWidget: Container(
            padding: EdgeInsets.only(right: 10),
            child: SvgPicture.asset("assets/sapatetangga/icon_add_user.svg"),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 20, bottom: 10),
                padding: EdgeInsets.only(left: 20, right: 45),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Nama Lengkap",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Color(0xff084A9A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Jenis Kelamin",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Color(0xff084A9A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Muhammad Iqbal",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Colors.black,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Pria",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Colors.black,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "NIK",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Color(0xff084A9A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Tempat Lahir",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Color(0xff084A9A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "123XXXXXXXX",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Colors.black,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Bekasi",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Colors.black,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 55, left: 360),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 5, bottom: 10),
                padding: EdgeInsets.only(left: 20, right: 45),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Nama Lengkap",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Color(0xff084A9A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Jenis Kelamin",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Color(0xff084A9A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Andhika Pratama",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Colors.black,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Pria",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Colors.black,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "NIK",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Color(0xff084A9A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Tempat Lahir",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Color(0xff084A9A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "123XXXXXXXX",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Colors.black,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Purwakarta",
                                    style: System.data.textStyleUtil.mainLabel(
                                      color: Colors.black,
                                      fontSize: System.data.fontUtil.mPlus,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 55, left: 360),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
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
