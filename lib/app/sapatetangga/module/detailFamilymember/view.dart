import 'package:enerren/app/sapatetangga/module/detailFamilymember/presenter.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class View extends PresenterState {
  double a = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BottonComponent.customAppBar1(
          context: context,
          actionText: "",
          title: "Anggota Keluarga",
          backgroundColor: Color(0xff084A9A),
          titleColor: Colors.white,
          rightWidget: Container(
            padding: EdgeInsets.only(right: 10),
            child: SvgPicture.asset("assets/sapatetangga/icon_add_user.svg"),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                  height: a,
                  duration: Duration(milliseconds: 1),
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "No. KK: 3205XXXXXXXXXX",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Color(0xff084A9A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: System.data.fontUtil.l,
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Nama Kepala Keluarga",
                                            style: System.data.textStyleUtil
                                                .mainLabel(
                                              color: Color(0xff084A9A),
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  System.data.fontUtil.mPlus,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Kecamatan",
                                            style: System.data.textStyleUtil
                                                .mainLabel(
                                              color: Color(0xff084A9A),
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  System.data.fontUtil.mPlus,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Ahmad Hanafi",
                                            style: System.data.textStyleUtil
                                                .mainLabel(
                                              color: Colors.black,
                                              fontSize:
                                                  System.data.fontUtil.mPlus,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Banyusari",
                                            style: System.data.textStyleUtil
                                                .mainLabel(
                                              color: Colors.black,
                                              fontSize:
                                                  System.data.fontUtil.mPlus,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Alamat",
                                            style: System.data.textStyleUtil
                                                .mainLabel(
                                              color: Color(0xff084A9A),
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  System.data.fontUtil.mPlus,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Kabupaten/Kota",
                                            style: System.data.textStyleUtil
                                                .mainLabel(
                                              color: Color(0xff084A9A),
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  System.data.fontUtil.mPlus,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Kalenraman Utara",
                                            style: System.data.textStyleUtil
                                                .mainLabel(
                                              color: Colors.black,
                                              fontSize:
                                                  System.data.fontUtil.mPlus,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Karawang",
                                            style: System.data.textStyleUtil
                                                .mainLabel(
                                              color: Colors.black,
                                              fontSize:
                                                  System.data.fontUtil.mPlus,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 150),
                          child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                              color: Colors.grey[600],
                            ),
                            onPressed: () {
                              a = 400;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 250, top: 10),
                  child: Text(
                    "Anggota Keluarga",
                    style: System.data.textStyleUtil.mainLabel(
                      color: Color(0xff084A9A),
                      fontWeight: FontWeight.bold,
                      fontSize: System.data.fontUtil.mPlus,
                    ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Nama Lengkap",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
                                        color: Color(0xff084A9A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: System.data.fontUtil.mPlus,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Jenis Kelamin",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Ahmad Hanafi",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
                                        color: Colors.black,
                                        fontSize: System.data.fontUtil.mPlus,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Pria",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "NIK",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
                                        color: Color(0xff084A9A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: System.data.fontUtil.mPlus,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Tempat Lahir",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "123XXXXXXXX",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
                                        color: Colors.black,
                                        fontSize: System.data.fontUtil.mPlus,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Karawang",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
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
                        margin: EdgeInsets.only(top: 55, left: 350),
                        child: IconButton(
                          onPressed: () =>
                              gotoExpandedDetailFamilyMember(context),
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black54,
                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Nama Lengkap",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
                                        color: Color(0xff084A9A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: System.data.fontUtil.mPlus,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Jenis Kelamin",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Yulia Ningsih",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
                                        color: Colors.black,
                                        fontSize: System.data.fontUtil.mPlus,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Wanita",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "NIK",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
                                        color: Color(0xff084A9A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: System.data.fontUtil.mPlus,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Tempat Lahir",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "123XXXXXXXX",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
                                        color: Colors.black,
                                        fontSize: System.data.fontUtil.mPlus,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Karawang",
                                      style:
                                          System.data.textStyleUtil.mainLabel(
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
                        margin: EdgeInsets.only(top: 55, left: 350),
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
