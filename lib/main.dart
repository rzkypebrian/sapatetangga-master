import 'dart:async';

import 'package:enerren/util/InternalDataUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/NavigationUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'util/SystemUtil.dart';
import 'util/ThemeUtil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'component/circularProgressIndicatorComponent.dart';
import 'route.dart' as route;

// import 'module/splashScreen/main.dart' as splashScreen;
// import 'module/home/main.dart' as splashScreen;

InternalDataUtil data = new InternalDataUtil();
StreamController<ThemeData> themesController = new StreamController();
CircularProgressIndicatorController loadingController =
    new CircularProgressIndicatorController();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  loadingController.stopLoading();
  route.initApp();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  data.themesController = themesController;
  initializeDateFormatting();

  runApp(new MyApp());
}

// Future<void> initDb(InternalDataUtil data) async {
//    data.database = await new DataBaseUtil(
//   ).initializeDb(onCreate: (db, version) {
//     if (version == 0) {
//       //init table notification
//       //set version
//       db.setVersion(1);
//     } else {
//       //init table notification
//       //set version
//       db.setVersion(1);
//     }
//   });
// }

Future<void> getPermission() async {
  for (var permition in System.data.permission) {
    await permition.request().then((value) {
      ModeUtil.debugPrint("${permition.toString()} grandted");
    }).catchError((onError) {
      ModeUtil.debugPrint(onError);
    });
  }
}

class MyApp extends StatefulWidget {
  @override
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool isCloseConfirm = false;
  String confirmMessage = "";

  @override
  void initState() {
    super.initState();
    System.data.routes.routeHistory.add(new RouteHistory(
      routeName: System.data.initialRouteName,
    ));
    if (!mounted) return;
    getPermission().then((value) {
      getOneSignalToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // System.data.initSharedPreference();
    System.data.context = context;
    //initial route history
    return StreamBuilder<ThemeData>(
        stream: data.themesController.stream,
        initialData: System.data.themeData ?? ThemeUtil().primary(),
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
          final themesData = snapshot.data;
          return ChangeNotifierProvider<InternalDataUtil>(
            create: (ctx) => data,
            child: MaterialApp(
              home: WillPopScope(
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Stack(
                    children: <Widget>[
                      new MaterialApp(
                        theme: themesData,
                        initialRoute: System.data.initialRouteName,
                        routes: System.data.mapRoute,
                        navigatorKey: System.data.navigatorKey,
                      ),
                      CircularProgressIndicatorComponent(
                        controller: loadingController,
                      )
                    ],
                  ),
                ),
                onWillPop: willPopCallback,
              ),
            ),
          );
        });
  }

  Future<bool> willPopCallback() async {
    if (System.data.routes.routeHistory.length <= 1) {
      return confirmExit();
    } else if (System.data.routes.routeHistory.last.needConfirm) {
      return confirmExit(
          meessage: System.data.routes.routeHistory.last.confirmMessage);
    } else {
      System.data.routes.removeLast();
      isCloseConfirm = false;
      return true;
    }
  }

  bool confirmExit({String meessage = ""}) {
    if (isCloseConfirm == false) {
      confirmMessage = meessage.isEmpty
          ? System.data.resource.tapAgainToCloseApp
          : System.data.routes.routeHistory.last.confirmMessage;
      isCloseConfirm = true;
      if (System.data.onAppWillClose != null) {
        System.data.onAppWillClose(loadingController);
      } else {
        loadingController.stopLoading(
            messageWidget: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: System.data.colorUtil.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(2, 3),
                      )
                    ]),
                child: Text(
                  "$confirmMessage",
                  textAlign: TextAlign.center,
                  style: System.data.textStyleUtil.mainLabel(),
                ),
              ),
            ),
            message: confirmMessage,
            duration: Duration(seconds: 3),
            onFinishCallback: () {
              isCloseConfirm = false;
            });
      }
      return false;
    } else {
      System.data.routes.removeLast();
      isCloseConfirm = false;
      return true;
    }
  }

  void showButtomSheet() {
    showModalBottomSheet(
      context: System.data.context,
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.red,
          width: double.infinity,
        );
      },
    );
  }

  void getOneSignalToken({int trial = 0}) {
    System.data.oneSignalMessaging.initOneSignal().then((onValue) async {
      await System.data.oneSignalMessaging.getTokenId().then(
        (token) {
          System.data.global.mmassagingToken = token;
          ModeUtil.debugPrint(
              "OneSignalMessagingToken trial to ${trial + 1} ${System.data.global.mmassagingToken}");
          if (System.data.global.mmassagingToken == null) {
            getOneSignalToken(
              trial: trial + 1,
            );
          }
        },
      );
    });
  }
}
