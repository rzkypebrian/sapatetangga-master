import 'package:enerren/app/sapatetangga/module/dataFamily/presenter.dart';
import 'package:enerren/component/BottonComponent.dart';
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
      bottomNavigationBar: GestureDetector(
        onTap: ()=> gotoEditData(context),
        child: Container(
          child: BottonComponent.roundedButton(
            radius: 0,
              text: "Edit",
              colorBackground: Color(0xff084A9A),
              textstyle: System.data.textStyleUtil.mainLabel(
                  fontWeight: FontWeight.bold,
                  color: System.data.colorUtil.lightTextColor,
                  fontSize: System.data.fontUtil.xl)),
        ),
      ),
      body: Container(
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
              ),
            ],
          ),
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: Text(
                          "Air Buangan",
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
                          "Cikampek",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Colors.black,
                            fontSize: System.data.fontUtil.mPlus,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Ada",
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
                          "No. Rumah",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Color(0xff084A9A),
                            fontWeight: FontWeight.bold,
                            fontSize: System.data.fontUtil.mPlus,
                          ),
                        ),
                      ),
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
                          "14",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Colors.black,
                            fontSize: System.data.fontUtil.mPlus,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Gas Elpiji",
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
                          "Listrik",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Color(0xff084A9A),
                            fontWeight: FontWeight.bold,
                            fontSize: System.data.fontUtil.mPlus,
                          ),
                        ),
                      ),
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
                          "900",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Colors.black,
                            fontSize: System.data.fontUtil.mPlus,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "001/005",
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
                          "Air Minum",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Color(0xff084A9A),
                            fontWeight: FontWeight.bold,
                            fontSize: System.data.fontUtil.mPlus,
                          ),
                        ),
                      ),
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
                          "PDAM",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Colors.black,
                            fontSize: System.data.fontUtil.mPlus,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Ada",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        child: Text(
                          "Ada",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Colors.black,
                            fontSize: System.data.fontUtil.mPlus,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
