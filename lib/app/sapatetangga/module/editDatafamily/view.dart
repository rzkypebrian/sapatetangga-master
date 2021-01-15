import 'package:enerren/app/sapatetangga/module/editDatafamily/presenter.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
// import 'package:enerren/component/BottonComponent.dart';
// import 'package:enerren/component/InputComponent.dart';
// import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BottonComponent.customAppBar1(
        context: context,
        actionText: "",
        title: "Data Rumah Tangga",
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
                  text: "Simpan",
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
                  text: "Batal",
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
        height: 550,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 20,bottom: 50),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Alamat",
                            style: System.data.textStyleUtil.mainLabel(
                              color: Color(0xff084A9A),
                              fontWeight: FontWeight.bold,
                              fontSize: System.data.fontUtil.mPlus,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          child: InputComponent.inputTextWithCorner(
                            controller: inputAlamat,
                            maxLines: 4,
                            borderWidth: 1,
                            corner: 5,
                            borderInputGray: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "No. Rumah",
                            style: System.data.textStyleUtil.mainLabel(
                              color: Color(0xff084A9A),
                              fontWeight: FontWeight.bold,
                              fontSize: System.data.fontUtil.mPlus,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          child: InputComponent.inputTextWithCorner(
                            controller: noRumah,
                            borderWidth: 1,
                            corner: 5,
                            borderInputGray: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Listrik",
                            style: System.data.textStyleUtil.mainLabel(
                              color: Color(0xff084A9A),
                              fontWeight: FontWeight.bold,
                              fontSize: System.data.fontUtil.mPlus,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          child: InputComponent.inputTextWithCorner(
                            controller: listrik,
                            borderWidth: 1,
                            corner: 5,
                            borderInputGray: Colors.black54,
                            suffixIcon: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.keyboard_arrow_down),
                              )
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Air Minum",
                            style: System.data.textStyleUtil.mainLabel(
                              color: Color(0xff084A9A),
                              fontWeight: FontWeight.bold,
                              fontSize: System.data.fontUtil.mPlus,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          child: InputComponent.inputTextWithCorner(
                            controller: airMinum,
                            borderWidth: 1,
                            corner: 5,
                            borderInputGray: Colors.black54,
                            suffixIcon: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.keyboard_arrow_down),
                              )
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Internet",
                            style: System.data.textStyleUtil.mainLabel(
                              color: Color(0xff084A9A),
                              fontWeight: FontWeight.bold,
                              fontSize: System.data.fontUtil.mPlus,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          child: InputComponent.inputTextWithCorner(
                            controller: internet,
                            borderWidth: 1,
                            corner: 5,
                            borderInputGray: Colors.black54,
                            suffixIcon: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.keyboard_arrow_down),
                              )
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Air Buangan",
                            style: System.data.textStyleUtil.mainLabel(
                              color: Color(0xff084A9A),
                              fontWeight: FontWeight.bold,
                              fontSize: System.data.fontUtil.mPlus,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          child: InputComponent.inputTextWithCorner(
                            controller: airBuangan,
                            borderWidth: 1,
                            corner: 5,
                            borderInputGray: Colors.black54,
                            suffixIcon: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.keyboard_arrow_down),
                              )
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Bahan Bakar Masak",
                            style: System.data.textStyleUtil.mainLabel(
                              color: Color(0xff084A9A),
                              fontWeight: FontWeight.bold,
                              fontSize: System.data.fontUtil.mPlus,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          child: InputComponent.inputTextWithCorner(
                            controller: bahanBakarMasak,
                            borderWidth: 1,
                            corner: 5,
                            borderInputGray: Colors.black54,
                            suffixIcon: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.keyboard_arrow_down),
                              )
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Air Cuci",
                            style: System.data.textStyleUtil.mainLabel(
                              color: Color(0xff084A9A),
                              fontWeight: FontWeight.bold,
                              fontSize: System.data.fontUtil.mPlus,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          child: InputComponent.inputTextWithCorner(
                            controller: airCuci,
                            borderWidth: 1,
                            corner: 5,
                            borderInputGray: Colors.black54,
                            suffixIcon: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.keyboard_arrow_down),
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15,bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Telepon",
                            style: System.data.textStyleUtil.mainLabel(
                              color: Color(0xff084A9A),
                              fontWeight: FontWeight.bold,
                              fontSize: System.data.fontUtil.mPlus,
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          child: InputComponent.inputTextWithCorner(
                            controller: telepon,
                            borderWidth: 1,
                            corner: 5,
                            borderInputGray: Colors.black54,
                            suffixIcon: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.keyboard_arrow_down),
                              )
                              // Icon(
                              //   Icons.keyboard_arrow_down,
                              // ),
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
    );
  }
}
