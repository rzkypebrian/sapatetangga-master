import 'dart:convert';
import 'dart:ui';

import 'package:enerren/app/angkut/aCustomer/LocalData.dart';
import 'package:enerren/component/ModalComponent.dart';
import 'package:enerren/model/NotificationSettingModel.dart';
import 'package:enerren/util/ApiEndPointUtil.dart';
import 'package:enerren/util/ColorUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/NotificationHandlerUtil.dart';
import 'package:enerren/util/OneSignalMessaging.dart';
import 'package:enerren/util/ResourceUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/app/angkut/aCustomer/route.dart' as route;
import 'package:enerren/app/angkut/util/ColorUtil.dart';
import 'package:enerren/app/angkut/util/ApiEndPoint.dart';
import 'package:enerren/util/constantUtil.dart';
import 'package:flutter/material.dart';
import 'package:enerren/app/angkut/util/ResourceUtil.dart';

void main() {
  System.data.initialRouteName = route.initialRouteName;
  System.data.unAuthorizeRouteName = route.RouteName.login;
  System.data.unAuthorizeRouteNameLimit = route.RouteName.dashboard;
  System.data.mapRoute = route.routes;
  System.data.colorUtil = ColorUtil().angkutColor();
  System.data.localData = LocalData();
  System.data.resource = ResourceUtil.ind().angkutId();
  System.data.apiEndPointUtil = ApiEndPointUtil().angkutCustomerApiEndPoint();
  System.data.oneSignalMessaging = new OneSignalMessaging(
    appId: "153fc0c9-eb4f-4136-bbd1-b60deca7fbd0",
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
