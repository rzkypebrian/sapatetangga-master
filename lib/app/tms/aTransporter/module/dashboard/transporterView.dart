import 'package:enerren/app/tms/aTransporter/localData.dart';
import 'package:enerren/component/ModalComponent.dart';
import 'package:enerren/component/externalLinkComponent.dart';
import 'package:enerren/component/menuComponent.dart';
import 'package:enerren/model/menuModel.dart';
import 'package:enerren/model/profileModel.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:component_icons/font_awesome.dart';
import 'package:enerren/app/tms/module/menu/main.dart' as menu;

import 'package:enerren/app/tms/module/dashboard/tmsView.dart';
import 'package:provider/provider.dart';
import 'transporterPresenter.dart';
import 'package:enerren/util/StringExtention.dart';
import 'viewModel.dart';

class TransporterView extends TmsView with TransporterPresenter {
  final VoidCallback onSetting;
  final VoidCallback onHistory;
  final VoidCallback onContactService;
  final VoidCallback onNotification;
  final ValueChanged<int> onTapRankSummary;
  final VoidCallback onTaplistVehicle;
  final VoidCallback onTapMap;

  @override
  void initState() {
    super.initState();
  }

  void initData() {
    super.profile = new ProfileModel(
      name: System.data.getLocal<LocalData>().user.transporterName ?? "",
      email: System.data.getLocal<LocalData>().user.transporterEmail ?? "",
      phone: System.data.getLocal<LocalData>().user.transporterMobile ?? "",
      urlImmage: System.data.getLocal<LocalData>().user.imageUrl.isNullOrEmpty()
          ? profile.urlImmage
          : System.data.getLocal<LocalData>().user.imageUrl,
      // urlImmage: null,
      registeredDate:
          System.data.getLocal<LocalData>().user.registeredDate ?? null,
    );
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return super.build(context);
  }

  TransporterView({
    this.onSetting,
    this.onHistory,
    this.onContactService,
    this.onNotification,
    this.onTapRankSummary,
    this.onTaplistVehicle,
    this.onTapMap,
  });

  @override
  Widget extraButton() {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: onNotification,
          child: Container(
            margin: EdgeInsets.only(right: 15, top: 0),
            padding: EdgeInsets.only(top: 20),
            height: 50,
            width: 25,
            child: SvgPicture.asset("assets/tms/icon_notification.svg"),
          ),
        ),
        GestureDetector(
          onTap: onSetting,
          child: Container(
            margin: EdgeInsets.only(right: 15, top: 0),
            padding: EdgeInsets.only(top: 20),
            height: 50,
            width: 25,
            child: SvgPicture.asset("assets/tms/icon_setting.svg"),
          ),
        ),
      ],
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
    return ChangeNotifierProvider<ViewModel>(
      create: (context) => super.model,
      child: Consumer<ViewModel>(
        builder: (ctx, data, child) {
          return Container(
            height: 170,
            width: double.infinity,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                eggItem(
                    icon: "assets/tms/icon_shipment_process.svg",
                    paddingValue: EdgeInsets.only(bottom: 20),
                    badgeColor: System.data.colorUtil.yellowColor,
                    label: "${System.data.resource.order}",
                    value: model.vehicleStatusSummary.order),
                eggItem(
                    icon: "assets/tms/icon_shipment_finish.svg",
                    paddingValue: EdgeInsets.only(bottom: 20),
                    badgeColor: System.data.colorUtil.greenColor,
                    label: "${System.data.resource.standBy}",
                    value: model.vehicleStatusSummary.standby),
                eggItem(
                    icon: "assets/tms/icon_shipment_cancel.svg",
                    paddingValue: EdgeInsets.only(bottom: 20),
                    badgeColor: System.data.colorUtil.redColor,
                    label: "${System.data.resource.rest}",
                    value: model.vehicleStatusSummary.rest),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget eggItem({
    String icon,
    EdgeInsetsGeometry paddingValue,
    String label,
    double width,
    double iconHeight,
    int value,
    VoidCallback onTap,
    Color badgeColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 60,
        height: 130,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SvgPicture.asset(
                  "${icon ?? "assets/tms/icon_egg_process.svg"}",
                  height: iconHeight ?? 60,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    paddingValue ?? const EdgeInsets.only(bottom: 20, left: 1),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: badgeColor ?? System.data.colorUtil.yellowColor,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      "${value != null ? value > 100 ? "99+" : value : "0"}",
                      style: System.data.textStyleUtil.mainLabel(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "$label",
                style: System.data.textStyleUtil.mainLabel(),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<MenuModel> menuItems() {
    return <MenuModel>[
      MenuModel(
          textMenu: "${System.data.resource.history}",
          immageAssetUrl: "assets/tms/icon_riwayat.svg",
          onTap: onHistory,
          icon: FontAwesomeRegular(FontAwesomeId.fa_list)),
      MenuModel(
          textMenu: "${System.data.resource.list}",
          immageAssetUrl: "assets/tms/icon_list.svg",
          onTap: onTaplistVehicle,
          icon: FontAwesomeRegular(FontAwesomeId.fa_plus)),
      MenuModel(
          textMenu: "${System.data.resource.contact}",
          iconHeight: 30,
          immageAssetUrl: "assets/tms/icon_contact.svg",
          onTap: openPopupContact,
          icon: FontAwesomeRegular(FontAwesomeId.fa_shipping_fast)),
      MenuModel(
          textMenu: "${System.data.resource.map}",
          iconHeight: 30,
          immageAssetUrl: "assets/tms/icon_map.svg",
          onTap: onTapMap,
          icon: FontAwesomeRegular(FontAwesomeId.fa_shipping_fast)),
    ];
  }

  @override
  Widget mainBody({
    List<MenuModel> Function() menus,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height -
          350 -
          MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            // stops: [0.9, 0.2],
            // stops: [0.7,0.5],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: <Color>[
              System.data.colorUtil.primaryColor2,
              System.data.colorUtil.primaryColor,
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 8),
              child: SvgPicture.asset(
                "assets/poweredby_tms.svg",
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height -
                390 -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
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

  void openPopupContact() {
    ModalComponent.bottomModalWithCorner(
      context,
      height: 220,
      child: Container(
        height: 200,
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: 200,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/tms/icon_contact_admin_dark.svg",
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      System.data.resource.admin,
                      style: System.data.textStyleUtil.mainTitle(
                        color: System.data.colorUtil.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MenuComponent.circleMenu(
                    sizeMenuButton: 60,
                    size: 60,
                    textMenuSpace: 0,
                    textMenu: "${System.data.resource.call}",
                    backgroundColor: Colors.white,
                    colorIcon: Colors.red,
                    neonStyle: false,
                    menu: Center(
                      child: SvgPicture.asset("assets/tms/phone.svg"),
                    ),
                    shadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      )
                    ],
                    onTap: () {
                      ExternalLinkComponent.openPhone(System.data
                          .getLocal<LocalData>()
                          .user
                          .adminPhoneNumber);
                    }),
                SizedBox(
                  width: 50,
                ),
                MenuComponent.circleMenu(
                  sizeMenuButton: 60,
                  size: 60,
                  textMenuSpace: 100,
                  textMenu: "${System.data.resource.chat}",
                  backgroundColor: Colors.white,
                  colorIcon: Colors.red,
                  neonStyle: false,
                  menu: Center(
                    child: SvgPicture.asset("assets/tms/comment.svg"),
                  ),
                  shadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    )
                  ],
                  onTap: () {
                    ExternalLinkComponent.openWA(System.data
                        .getLocal<LocalData>()
                        .user
                        .adminWhatsAppNumber);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
