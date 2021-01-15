import 'dart:convert';
import 'dart:ui';

import 'package:enerren/app/tms/aCustomer/localData.dart';
import 'package:enerren/component/ModalComponent.dart';
import 'package:enerren/model/NotificationModel.dart';
import 'package:enerren/model/NotificationSettingModel.dart';
import 'package:enerren/util/ApiEndPointUtil.dart';
import 'package:enerren/util/ColorUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/OneSignalMessaging.dart';
import 'package:enerren/util/ResourceUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/app/tms/aCustomer/route.dart' as route;
import 'package:enerren/app/tms/util/ColorUtil.dart';
import 'package:enerren/app/tms/util/ApiEndPointUtil.dart';
import 'package:enerren/util/constantUtil.dart';

Future<void> main() async {
  System.data.colorUtil = ColorUtil().tmsCustomerColor();
  System.data.resource = ResourceUtil.ind();
  System.data.initialRouteName = route.initialEouteName;
  System.data.unAuthorizeRouteName = route.RouteName.login;
  System.data.mapRoute = route.routes;
  System.data.localData = LocalData();
  System.data.apiEndPointUtil = ApiEndPointUtil().tmsCustomerApiEndPoimt();
  System.data.oneSignalMessaging = new OneSignalMessaging(
    appId: "c929e091-ea1b-4d58-8918-e0064adadad9",
    notificationHandler: (notif) {
      ModeUtil.debugPrint("on receive notification");
      NotificationSettingModel _setting;
      try {
        _setting = NotificationSettingModel.fromJson(
            json.decode(notif.payload.additionalData["setting"]));
      } catch (e) {
        ModeUtil.debugPrint("$e");
      }
      try {
        NotificationModel.addData(
          System.data.database.db,
          new NotificationModel(
            title: notif.payload.title,
            body: notif.payload.body,
            setting: _setting.toJson(),
            smallIcon: notif.payload.smallIcon,
            userId: "",
            dataType: "",
            data: {},
          ),
        );
      } catch (e) {
        ModeUtil.debugPrint("$e");
      }
      return ModalComponent.modalNotification(
        title: json.decode(notif.payload.additionalData[ConstantUtil.title])[
            "${System.data.resource.lang.replaceAll("-", "_")}"],
        titleColor:
            _setting.titleColor != null ? Color(_setting.titleColor) : null,
        body: json.decode(notif.payload.additionalData[ConstantUtil.body])[
            "${System.data.resource.lang.replaceAll("-", "_")}"],
        bodyColor:
            _setting.bodyColor != null ? Color(_setting.bodyColor) : null,
        imageUrl: notif.payload.smallIcon,
        imageBackgroundColor: Color(0xffBEFFDA),
      );
    },
  );
}
