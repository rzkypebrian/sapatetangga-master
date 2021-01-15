import 'dart:convert';

import 'package:enerren/component/ModalComponent.dart';
import 'package:enerren/model/NotificationSettingModel.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'SystemUtil.dart';

class NotificationHandlerUtil {
  Future<T> onReceiveNotification<T>(OSNotification notif) {
    NotificationSettingModel _setting;
    try {
      _setting = NotificationSettingModel.fromJson(
          json.decode(notif.payload.additionalData["setting"]));
    } catch (e) {
      ModeUtil.debugPrint("$e");
    }
    ModeUtil.debugPrint(notif.payload.smallIcon);
    return ModalComponent.modalNotification(
      title: notif.payload.title,
      titleColor:
          _setting.titleColor != null ? Color(_setting.titleColor) : null,
      body: notif.payload.body,
      bodyColor: _setting.bodyColor != null ? Color(_setting.bodyColor) : null,
      imageUrl: notif.payload.smallIcon,
      imageBackgroundColor: Color(0xffBEFFDA),
    );
  }

  static String readNotification(String stringNotif, String alternatif) {
    try {
      return json.decode(
          stringNotif)["${System.data.resource.lang.replaceAll("-", "_")}"];
    } catch (e) {
      return stringNotif ?? alternatif;
    }
  }
}
