
import 'package:enerren/util/OneSignalMessaging.dart';
import 'package:enerren/util/ResourceUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/app/sapatetangga/route.dart' as route;

void main(){
  System.data.resource = ResourceUtil.ind();
  System.data.initialRouteName = route.initialRouteName;
  System.data.mapRoute = route.routes;
  System.data.oneSignalMessaging = new OneSignalMessaging(
    appId: "a04dd642-9080-47b6-8b09-fed9cabed8c8",
  );
}