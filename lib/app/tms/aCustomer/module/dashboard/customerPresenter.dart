import 'dart:async';

import 'package:enerren/app/tms/aCustomer/localData.dart';
import 'package:enerren/component/tmsDecorationComponent.dart';
import 'package:enerren/model/CustomerModel.dart';
import 'package:enerren/model/tmsCountModelShipmentSummaryModel.dart';
import 'package:enerren/util/ErrorHandlingUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:enerren/app/tms/module/dashboard/tmsPresenter.dart';

mixin CustomerPresenter on TmsPresenter {
  @override
  void initState() {
    super.initState();
    loadingController.startLoading(
      coverScreen: false,
    );
    getShipmentSummary();
    getProfile();
  }

  void getShipmentSummary() {
    ModeUtil.debugPrint(System.data.global.token);
    TmsCountShipmentSummaryModel.get(
      token: System.data.global.token,
    ).then((onValue) {
      ModeUtil.debugPrint(onValue.toJson());
      System.data.getLocal<LocalData>().shipmentCountSummary = onValue;
      System.commit();
      loadingController.stopLoading();
      Timer.periodic(Duration(seconds: System.data.global.intervalUpdateData),
          (t) {
        getShipmentSummary();
        t.cancel();
      });
    }).catchError((onError) {
      loadingController.stopLoading(
          messageAlign: Alignment.topCenter,
          messageWidget: DecorationComponent.topMessageDecoration(
            backgroundColor: System.data.colorUtil.redColor,
            message: ErrorHandlingUtil.handleApiError(onError),
          ));
    });
  }

  void getProfile() {
    CustomerModel.getProfile(
      token: System.data.global.token,
    ).then((value) {
      System.data.getLocal<LocalData>().user = value;
      System.commit();
      Timer.periodic(Duration(seconds: System.data.global.intervalUpdateData),
          (t) {
        getProfile();
        t.cancel();
      });
    }).catchError((onError) {
      loadingController.stopLoading(
          messageAlign: Alignment.topCenter,
          messageWidget: DecorationComponent.topMessageDecoration(
            backgroundColor: System.data.colorUtil.redColor,
            message: ErrorHandlingUtil.handleApiError(
              onError,
              prefix: "error get profile",
            ),
          ));
    });
  }
}
