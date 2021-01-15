import 'package:enerren/app/sapatetangga/module/expandedDetailfamilymember/presenter.dart';
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
          title: "Anggota Keluarga",
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
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
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
                                "Nama Lengkap",
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
                                "123XXXXXXX",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Ahmad Hanafi",
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
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Nama Depan",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Color(0xff084A9A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Nama Belakang",
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
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Ahmad",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Hanafi",
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
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
                            Container(
                              child: Text(
                                "Tanggal Lahir",
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
                                "Karawang",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "08/12/1952",
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
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
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
                            Container(
                              child: Text(
                                "Warga Negara",
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
                                "Pria",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Indonesia",
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
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Pekerjaan",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Color(0xff084A9A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Agama",
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
                                "Wiraswasta",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Islam",
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
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Status Kawin",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Color(0xff084A9A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Alamat Tinggal",
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
                                "Sudah Kawin",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Karawang",
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
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Alamat Asal",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Color(0xff084A9A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Status Tempat Tinggal",
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
                                "Karawang",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Tetap",
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
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Pendidikan",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Color(0xff084A9A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Golongan Darah",
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
                                "SMA",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "O",
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
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Cacat",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Color(0xff084A9A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Nomor Telepon",
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
                                "Tidak Cacat",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "087879096464",
                                style: System.data.textStyleUtil.mainLabel(
                                  color: Colors.black,
                                  fontSize: System.data.fontUtil.mPlus,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   child: Column(
                      //     children: <Widget>[
                      //       Container(
                      //         padding: EdgeInsets.only(top: 10, right: 365),
                      //         child: Text(
                      //           "File",
                      //           style: System.data.textStyleUtil.mainLabel(
                      //             color: Color(0xff084A9A),
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: System.data.fontUtil.mPlus,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
