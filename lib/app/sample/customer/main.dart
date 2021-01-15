import 'package:enerren/util/ApiEndPointUtil.dart';
import 'package:enerren/util/ColorUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/OneSignalMessaging.dart';
import 'package:enerren/util/ResourceUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/app/sample/util/ColorUtil.dart';
import 'package:enerren/app/sample/customer/route.dart' as route;
import 'package:enerren/app/sample/util/ApiEndPointUtil.dart';
import 'package:flutter/material.dart';

void main() {
  System.data.resource = ResourceUtil.ind();
  System.data.initialRouteName = route.initialRouteName;
  System.data.mapRoute = route.routes;
  System.data.apiEndPointUtil = ApiEndPointUtil().sampleCustomerApiEndPoimt();
  System.data.colorUtil = ColorUtil().sieradCustomerColor();
  System.data.oneSignalMessaging =
      new OneSignalMessaging(notificationHandler: (value) {
    ModeUtil.debugPrint("notificationHandler ${value.payload.body}");
    // System.data.routes.pushNamed(System.data.context, route.RouteName.login);
    // DeviceApps.openApp("com.enerren.sierad.customer");
    return showModalBottomSheet(
      context: System.data.navigatorKey.currentContext,
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.red,
          width: double.infinity,
        );
      },
    );
  }, notificationClickedHandler: (value) {
    ModeUtil.debugPrint("notificationClickedHandler ");
    System.data.routes.pushNamed(System.data.context, route.RouteName.login);
  }, notificationOpenedHandler: (value) {
    ModeUtil.debugPrint("notificationOpenedHandler ");
    ModeUtil.debugPrint(value.notification.payload.body);
    // DeviceApps.openApp("com.enerren.sierad.customer");
  });
}
