import 'dart:async';
import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/util/ApiEndPointUtil.dart';
import 'package:enerren/util/OneSignalMessaging.dart';
import 'package:enerren/util/TextStyleUtil.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ColorUtil.dart';
import 'DatabaseUtil.dart';
import 'FacebookLoginUtil.dart';
import 'FontUtil.dart';
import 'GlobalDataUtil.dart';
import 'GoogleSignUtil.dart';
import 'NavigationUtil.dart';
import 'ThemeUtil.dart';

import 'ResourceUtil.dart';

class InternalDataUtil extends ChangeNotifier {
  static final InternalDataUtil data = new InternalDataUtil._internal();

  static const String LANG = "Lang";
  String versionName;
  String version = "1.1.1";

  dynamic themesController;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NavigationUtil routes = new NavigationUtil();
  Map<String, WidgetBuilder> mapRoute = {};
  String initialRouteName = "";
  ResourceUtil resource = new ResourceUtil();
  ColorUtil colorUtil = new ColorUtil();
  FontUtil fontUtil = new FontUtil();
  TextStyleUtil textStyleUtil = new TextStyleUtil();
  GlobalDataUtil global = new GlobalDataUtil();
  ThemeData themeData = ThemeUtil().primary();
  String fontFamily = FontUtil().primary;
  ApiEndPointUtil apiEndPointUtil = new ApiEndPointUtil();
  ThemeUtil themeUtil = new ThemeUtil();
  DataBaseUtil database;
  String unAuthorizeRouteName;
  String unAuthorizeRouteNameLimit = "";
  VoidCallback onUnAuthorized;
  List<Permission> permission = [];

  SharedPreferences sharedPreferences;
  Map<DataKey, dynamic> sharedData = Map<DataKey, dynamic>();

  //third party login
  GoogleSignUtil googleSign = new GoogleSignUtil();
  FacebookLoginUtil facebookLogin = new FacebookLoginUtil();
  //

  ValueChanged<CircularProgressIndicatorController> onAppWillClose;

  bool isFirstLoad = true;
  Timer autoRefreshTimer;
  bool autoRefreshDefined = false;
  bool autoRefresh = true;
  bool runCallback = false;

  Duration autoRefreshInterval = Duration(seconds: 10);

  dynamic localData = {};

  BuildContext context;

  T getLocal<T>() {
    return (this.localData as T);
  }

  set setResource(ResourceUtil resource) {
    this.resource = resource;
  }

  //oneSignal for messaging service
  OneSignalMessaging oneSignalMessaging = new OneSignalMessaging();

  static void clearData() {
    InternalDataUtil.data.sharedPreferences.clear();
  }

  InternalDataUtil() {
    _initSharedPreference();
    _initDatabse();
  }

  Future<bool> _initSharedPreference() async {
    this.sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }

  Future<bool> _initDatabse() async {
    this.database = await new DataBaseUtil().initializeDb();
    return true;
  }

  InternalDataUtil._internal();

  void commit() {
    notifyListeners();
  }
}

class SystemStream {
  InternalDataUtil data;

  SystemStream(this.data) {
    _evenController.stream.listen(_mapEventToState);
  }

  StreamController<InternalDataUtil> _evenController =
      StreamController<InternalDataUtil>();
  StreamSink<InternalDataUtil> get eventSink => _evenController.sink;

  StreamController<InternalDataUtil> _stateController =
      StreamController<InternalDataUtil>();
  StreamSink<InternalDataUtil> get stateSink => _stateController.sink;

  Stream<InternalDataUtil> get stateStream => _stateController.stream;

  void _mapEventToState(InternalDataUtil data) {
    stateSink.add(InternalDataUtil.data);
  }

  void setState() {
    eventSink.add(InternalDataUtil.data);
  }

  void dispose() {
    _evenController.close();
    _stateController.close();
  }
}

enum DataKey {
  shipments,
  shipment,
}
