import 'package:enerren/app/sample/customer/module/login/main.dart' as login;
import 'package:enerren/module/home/main.dart' as home;
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';

//definisikan enum name alur program anda disini
class RouteName {
  static const String home = "home";
  static const String login = "login";
}

//definisikan initial root name
String initialRouteName = RouteName.home;

//definisikan alur program aplikasi anda disini
Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  RouteName.home: (BuildContext context) => home.Presenter(
        onTapModule: () {
          ModeUtil.debugPrint("masuk sini");
          System.data.routes.pushNamed(context, RouteName.login);
        },
      ),
  RouteName.login: (BuildContext context) => login.Presenter(
        view: login.CustomerView(),
        onLoginSuccess: (json) {},
        onSubmitSuccess: () {},
      )
};
