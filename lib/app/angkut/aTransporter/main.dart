import 'dart:convert';
import 'dart:ui';

import 'package:enerren/app/angkut/aTransporter/localData.dart';
import 'package:enerren/component/ModalComponent.dart';
import 'package:enerren/model/NotificationSettingModel.dart';
import 'package:enerren/util/ApiEndPointUtil.dart';
import 'package:enerren/util/ColorUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/NotificationHandlerUtil.dart';
import 'package:enerren/util/OneSignalMessaging.dart';
import 'package:enerren/util/ResourceUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/app/angkut/aTransporter/route.dart' as route;
import 'package:enerren/app/angkut/util/ColorUtil.dart';
import 'package:enerren/app/angkut/util/ApiEndPoint.dart';
import 'package:enerren/util/constantUtil.dart';
import 'package:enerren/app/angkut/util/ResourceUtil.dart';

void main() {
  System.data.colorUtil = ColorUtil().angkutColor();
  System.data.resource = ResourceUtil.ind().angkutId();
  System.data.initialRouteName = route.initialEouteName;
  System.data.unAuthorizeRouteName = route.RouteName.login;
  System.data.mapRoute = route.routes;
  System.data.localData = LocalData();
  System.data.apiEndPointUtil = ApiEndPointUtil().angkutTransporterEndPoint();
  System.data.oneSignalMessaging = new OneSignalMessaging(
    appId: "6796dcfe-b86b-40be-832f-439558df6698",
    notificationHandler: (notif) {
      ModeUtil.debugPrint("isi notif ${notif.payload.body}");
      NotificationSettingModel _setting;
      try {
        _setting = NotificationSettingModel.fromJson(
            json.decode(notif.payload.additionalData["setting"]));
      } catch (e) {
        ModeUtil.debugPrint("$e");
      }
      return ModalComponent.modalNotification(
        title: NotificationHandlerUtil.readNotification(
            notif.payload.additionalData[ConstantUtil.title],
            notif.payload.title),
        titleColor:
            _setting.titleColor != null ? Color(_setting.titleColor) : null,
        body: NotificationHandlerUtil.readNotification(
            notif.payload.additionalData[ConstantUtil.body],
            notif.payload.body),
        bodyColor:
            _setting.bodyColor != null ? Color(_setting.bodyColor) : null,
        imageUrl: notif.payload.smallIcon,
        imageBackgroundColor: Color(0xffBEFFDA),
      );
    },
  );
}
