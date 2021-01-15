import 'package:enerren/app/tms/module/dashboard/tmsPresenter.dart';
import 'package:enerren/component/tmsDecorationComponent.dart';
import 'package:enerren/model/menuModel.dart';
import 'package:enerren/util/InternalDataUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:component_icons/font_awesome.dart';
import 'package:enerren/app/tms/module/menu/main.dart' as menu;

import 'package:enerren/module/dashboard/view.dart';
import 'package:provider/provider.dart';

class TmsView extends View with TmsPresenter {
  Container header() {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      padding: EdgeInsets.only(top: 5),
      height: 123,
      child: GestureDetector(
        onTap: () => gotoProfile(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: System.data.colorUtil.borderInputColor,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 3),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ]),
              child: CircleAvatar(
                backgroundImage: NetworkImage("${profile.urlImmage}"),
                backgroundColor: Colors.white30,
                radius: 30,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${profile.name}",
              style: System.data.textStyleUtil.linkLabel(
                fontSize: System.data.fontUtil.xl,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: System.data.colorUtil.scaffoldBackgroundColor,
      body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      logo(),
                      header(),
                      ranking(width: 250, value: 30),
                    ],
                  ),
                ),
                Align(alignment: Alignment.bottomCenter, child: mainBody()),
                DecorationComponent.circularProgressDecoration(
                  controller: super.loadingController,
                )
              ],
            ),
          )),
    );
  }

  Widget mainBody({
    List<MenuModel> Function() menus,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height - 350,
      decoration: BoxDecoration(
          gradient: LinearGradient(stops: [
            0,
            0
          ], colors: <Color>[
            System.data.colorUtil.primaryColor,
            System.data.colorUtil.primaryColor2,
          ]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset("assets/sierad/egg_8.svg"),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset("assets/sierad/egg_9.svg"),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/poweredby_tms.svg",
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 400,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(55),
                  topRight: Radius.circular(55),
                  bottomLeft: Radius.elliptical(300, 120),
                  bottomRight: Radius.elliptical(300, 120),
                )),
          ),
          menu.Presenter(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.only(top: 10),
              view: menu.TmsView(),
              width: MediaQuery.of(context).size.width,
              heigth: MediaQuery.of(context).size.height - 430,
              menus: menuItems),
        ],
      ),
    );
  }

  Decoration decoration() {
    return BoxDecoration(
      color: Colors.transparent,
    );
  }

  Widget logo() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          company(),
          extraButton(),
        ],
      ),
    );
  }

  Widget company() {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 15),
      child: SvgPicture.asset(
        "assets/tms/logo_tms.svg",
        height: 30,
      ),
    );
  }

  Widget ranking({
    @required double width,
    @required double value,
    String animation1 = "assets/flares/empty_score1.flr",
    String animation2 = "assets/flares/empty_score2.flr",
    String animation3 = "assets/flares/empty_score3.flr",
    String moveAnimationName = "move",
    String stayAnimationName = "stay",
    Color barValueColor,
    Color barBackgroudColor,
    TextStyle valueStyle,
    int lowScore = 50,
    int midleScore = 70,
    int hightScore = 80,
  }) {
    return Consumer<InternalDataUtil>(
      builder: (ctx, data, child) {
        return Center(
          child: Container(
            height: 150,
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: width,
                    height: 100,
                    // color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: value < lowScore ? 80 : 60,
                          width: value < lowScore ? 80 : 60,
                          // color: Colors.red,
                          child: FlareActor(
                            "$animation3",
                            animation:
                                "${value < 50 ? "$moveAnimationName" : "$stayAnimationName"}",
                            controller: flare1,
                          ),
                        ),
                        Container(
                          height:
                              value >= lowScore && value < midleScore ? 80 : 60,
                          width:
                              value >= lowScore && value < midleScore ? 80 : 60,
                          // color: Colors.green,
                          child: FlareActor(
                            "$animation2",
                            animation:
                                "${value >= 50 && value < 70 ? "$moveAnimationName" : "$stayAnimationName"}",
                          ),
                        ),
                        Container(
                          height: value >= midleScore ? 80 : 70,
                          width: value >= midleScore ? 80 : 70,
                          // color: Colors.purple,
                          child: FlareActor(
                            "$animation1",
                            animation:
                                "${value >= 70 ? "$moveAnimationName" : "$stayAnimationName"}",
                          ),
                        ),
                        // SvgPicture.asset("assets/icon_driver_star_1.svg"),
                        // SvgPicture.asset("assets/icon_driver_star_2.svg"),
                        // SvgPicture.asset("assets/icon_driver_star_3.svg"),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: 9,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: (width * value / 100) + 10.0,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_drop_up, color: Colors.red)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: width,
                  height: 8,
                  child: Container(
                    color: System.data.colorUtil.scafoldColor,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: (width * value / 100),
                        color: System.data.colorUtil.primaryColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(top: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: (width * value / 100) + 10.0,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "${value / 10}",
                          style: System.data.textStyleUtil.linkLabel(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget extraButton() {
    return Container(
      width: 0,
      height: 0,
    );
  }

  List<MenuModel> menuItems() {
    return <MenuModel>[
      MenuModel(
          textMenu: "menu 1",
          immageAssetUrl: "assets/icon_user.svg",
          iconHeight: 30,
          iconWidht: 30,
          onTap: () => ModeUtil.debugPrint("menu 1 tapped"),
          icon: FontAwesomeRegular(FontAwesomeId.fa_plus)),
      MenuModel(
          textMenu: "menu 2",
          immageAssetUrl: "assets/icon_user.svg",
          iconHeight: 30,
          iconWidht: 30,
          onTap: () => ModeUtil.debugPrint("menu 2 tapped"),
          icon: FontAwesomeRegular(FontAwesomeId.fa_list)),
      MenuModel(
          textMenu: "menu 3",
          immageAssetUrl: "assets/icon_user.svg",
          iconHeight: 30,
          iconWidht: 30,
          onTap: () => ModeUtil.debugPrint("menu 3 tapped"),
          icon: FontAwesomeRegular(FontAwesomeId.fa_shipping_fast)),
      MenuModel(
          textMenu: "menu 4",
          onTap: () => ModeUtil.debugPrint("menu 4 tapped"),
          immageAssetUrl: "assets/icon_user.svg",
          iconHeight: 30,
          iconWidht: 30,
          icon: FontAwesomeRegular(FontAwesomeId.fa_money_check_alt),
          iconMargin: EdgeInsets.only(right: 5)),
      MenuModel(
          textMenu: "menu 5",
          immageAssetUrl: "assets/icon_user.svg",
          iconHeight: 30,
          iconWidht: 30,
          onTap: () => ModeUtil.debugPrint("menu 5 tapped"),
          icon: FontAwesomeRegular(FontAwesomeId.fa_box_check),
          iconMargin: EdgeInsets.only(right: 3)),
      MenuModel(
          textMenu: "menu 6",
          immageAssetUrl: "assets/icon_user.svg",
          iconHeight: 30,
          iconWidht: 30,
          onTap: () => ModeUtil.debugPrint("menu 6 tapped"),
          icon: FontAwesomeRegular(FontAwesomeId.fa_calculator_alt)),
    ];
  }
}
