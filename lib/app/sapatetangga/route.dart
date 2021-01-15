import 'package:enerren/app/sapatetangga/module/login/main.dart' as login;
import 'package:enerren/app/sapatetangga/module/dashboard/main.dart'
    as dashboard;
import 'package:enerren/app/sapatetangga/module/detailFamily/main.dart'
    as detailFamily;
import 'package:enerren/app/sapatetangga/module/dataFamily/main.dart'
    as dataFamily;
import 'package:enerren/app/sapatetangga/module/listReport/main.dart' as report;
import 'package:enerren/app/sapatetangga/module/listInformation/main.dart'
    as information;
import 'package:enerren/app/sapatetangga/module/expandedDetailfamilymember/main.dart'
    as expandedDetailFamilyMember;
import 'package:enerren/app/sapatetangga/module/detailFamilymember/main.dart'
    as detailFamilyMember;
import 'package:enerren/app/sapatetangga/module/detailNonfamilymember/main.dart'
    as detailNonFamilyMember;
import 'package:enerren/app/sapatetangga/module/detailListreport/main.dart'
    as detailListReport;
import 'package:enerren/app/sapatetangga/module/editDatafamily/main.dart'
    as editDataFamily;
import 'package:enerren/app/sapatetangga/module/detailListinformation/main.dart'
    as detailListInformation;
import 'package:enerren/app/sapatetangga/module/map/main.dart' as maps;
import 'package:enerren/app/sapatetangga/module/forgetPassword/main.dart' as forgetPassword;
import 'package:enerren/app/sapatetangga/module/addNewAccount/main.dart' as addNewAccount;
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const login = "login";
  static const dashboard = "dashboard";
  static const dataFamily = "dataFamily";
  static const detailFamily = "detailFamily";
  static const report = "report";
  static const information = "information";
  static const expandedDetailFamilyMember = "expandedDetailFamilyMember";
  static const detailFamilyMember = "detailFamilyMember";
  static const detailNonFamilyMember = "detailNonFamilyMember";
  static const detailListReport = "detailListReport";
  static const detailListInformation = "detailListInformation";
  static const editDataFamily = "editDataFamily";
  static const maps = "maps";
  static const forgetPassword = "forgetPassword";
  static const addNewAccount = "addNewAccount";
}

String initialRouteName = RouteName.maps;

Map<String, WidgetBuilder> routes = {
  RouteName.login: (BuildContext context) {
    return login.Presenter(
      onSuccess: () {
        System.data.routes.pushAndReplaceName(context, RouteName.dashboard);
      },
    );
  },
  RouteName.dashboard: (BuildContext context) {
    return dashboard.Presenter(
      gotoFamily: () {
        System.data.routes.pushNamed(context, RouteName.detailFamily);
      },
      gotoDataFamily: () {
        System.data.routes.pushNamed(context, RouteName.dataFamily);
      },
      gotoReport: () {
        System.data.routes.pushNamed(context, RouteName.report);
      },
      gotoInformation: () {
        System.data.routes.pushNamed(context, RouteName.information);
      },
    );
  },
  RouteName.dataFamily: (BuildContext context) {
    return dataFamily.Presenter(gotoEditData: () {
      System.data.routes.pushNamed(context, RouteName.editDataFamily);
    });
  },
  RouteName.editDataFamily: (BuildContext context) {
    return editDataFamily.Presenter(view: editDataFamily.View());
  },
  RouteName.detailFamily: (BuildContext context) {
    return detailFamily.Presenter(
      gotoDetailFamilyMember: () {
        System.data.routes.pushNamed(context, RouteName.detailFamilyMember);
      },
      gotoDetailNonFamilyMember: () {
        System.data.routes.pushNamed(context, RouteName.detailNonFamilyMember);
      },
    );
  },
  RouteName.report: (BuildContext context) {
    return report.Presenter(
      gotoDetailListReport: () {
        System.data.routes.pushNamed(context, RouteName.detailListReport);
      },
    );
  },
  RouteName.information: (BuildContext context) {
    return information.Presenter(
      gotoDetailListInformation: () {
        System.data.routes.pushNamed(context, RouteName.detailListInformation);
      },
    );
  },
  RouteName.detailFamilyMember: (BuildContext context) {
    return detailFamilyMember.Presenter(
      gotoExpandedDetailFamilyMember: () {
        System.data.routes
            .pushNamed(context, RouteName.expandedDetailFamilyMember);
      },
    );
  },
  RouteName.expandedDetailFamilyMember: (BuildContext context) {
    return expandedDetailFamilyMember.Presenter(
      view: expandedDetailFamilyMember.View(),
    );
  },
  RouteName.detailNonFamilyMember: (BuildContext context) {
    return detailNonFamilyMember.Presenter();
  },
  RouteName.detailListReport: (BuildContext context) {
    return detailListReport.Presenter();
  },
  RouteName.detailListInformation: (BuildContext context) {
    return detailListInformation.Presenter();
  },

  RouteName.maps: (BuildContext context) {
    return maps.Presenter(
    );

  },
  RouteName.forgetPassword: (BuildContext context) {
    return forgetPassword.Presenter();
  },
  RouteName.addNewAccount: (BuildContext context) {
    return addNewAccount.Presenter();
  }

};
