import 'dart:convert';
import 'dart:io';

import 'package:enerren/util/NetworkUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'AngkutShipmentModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'AngkutUangJalanDetailExpenseViewModel.dart';
part 'AngkutUangJalanSummaryViewModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AngkutUangJalanSummaryViewModel {
  int summaryId;
  int tmsShipmentId;
  int driverId;
  String driverNik;
  String driverName;
  String driverImageUrl;
  DateTime driverBirthDate;
  String driverEmail;
  String driverSimType;
  double driverScore;
  String driverAddress;
  String driverPhoneNumber;
  int vehicleId;
  String vehicleName;
  String vehicleNumber;
  int vehicleIdVts;
  String vehicleRegNumber;
  DateTime vehicleRegDate;
  int vehicleStatusId;
  String vehicleStatusName;
  int vehicleTypeId;
  String vehicleTypeName;
  String transporterCode;
  String transporterName;
  DateTime transactionDate;
  double beginningBalance;
  double totalExpense;
  double endingBalance;
  int status;
  String remarks;
  List<AngkutUangJalanDetailExpenseViewModel> uangJalanDetailExpense;
  AngkutShipmentModel shipmentHeaderData;

  AngkutUangJalanSummaryViewModel({
    this.summaryId,
    this.tmsShipmentId,
    this.driverId,
    this.driverNik,
    this.driverName,
    this.driverImageUrl,
    this.driverBirthDate,
    this.driverEmail,
    this.driverSimType,
    this.driverScore,
    this.driverAddress,
    this.driverPhoneNumber,
    this.vehicleId,
    this.vehicleName,
    this.vehicleNumber,
    this.vehicleIdVts,
    this.vehicleRegNumber,
    this.vehicleRegDate,
    this.vehicleStatusId,
    this.vehicleStatusName,
    this.vehicleTypeId,
    this.vehicleTypeName,
    this.transporterCode,
    this.transporterName,
    this.transactionDate,
    this.beginningBalance,
    this.totalExpense,
    this.endingBalance,
    this.status,
    this.remarks,
    this.uangJalanDetailExpense,
    this.shipmentHeaderData,
  });

  factory AngkutUangJalanSummaryViewModel.fromJson(Map<String, dynamic> json) =>
      _$AngkutUangJalanSummaryViewModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AngkutUangJalanSummaryViewModelToJson(this);

  static Future<List<AngkutUangJalanSummaryViewModel>> getUangJalanList({
    @required String token,
    String shipmentNumber,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.get(
      System.data.apiEndPointUtil
          .getUangJalanList(shipmentNumber: shipmentNumber),
      headers: {
        "lang": "${System.data.resource.lang}",
        HttpHeaders.authorizationHeader: "bearer $token",
      },
    ).then((onValue) {
      if (onValue.toString().isNotEmpty) {
        return (json.decode(onValue) as List)
            .map((f) => AngkutUangJalanSummaryViewModel.fromJson(f))
            .toList();
      } else {
        return null;
      }
    }).catchError((onError) {
      throw onError;
    });
  }

  static Future<AngkutUangJalanSummaryViewModel> addUangJalan({
    @required String token,
    @required String shipmentNumber,
    @required double beginningBalance,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.post(
      System.data.apiEndPointUtil.addUangJalan(
        beginningBalance: beginningBalance,
        shipmentNumber: shipmentNumber,
      ),
      headers: {
        "lang": "${System.data.resource.lang}",
        HttpHeaders.authorizationHeader: "bearer $token",
      },
    ).then((onValue) {
      if (onValue.toString().isNotEmpty) {
        return AngkutUangJalanSummaryViewModel.fromJson(json.decode(onValue));
      } else {
        return null;
      }
    }).catchError((onError) {
      throw onError;
    });
  }

  static Future<AngkutUangJalanSummaryViewModel> addUangJalanDriver({
    @required String token,
    @required Map param,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.post(
      System.data.apiEndPointUtil.addUangJalanExpense(),
      body: param,
      headers: {
        "lang": "${System.data.resource.lang}",
        HttpHeaders.authorizationHeader: "bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    ).then((onValue) {
      if (onValue.toString().isNotEmpty) {
        return AngkutUangJalanSummaryViewModel.fromJson(json.decode(onValue));
      } else {
        return null;
      }
    }).catchError((onError) {
      throw onError;
    });
  }

  static Future<AngkutUangJalanSummaryViewModel> deleteUangJalanExpense({
    @required String token,
    @required List walletId,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.post(
      System.data.apiEndPointUtil.deleteUangJalanExpense(),
      boolListBodies: true,
      bodies: walletId,
      headers: {
        "lang": "${System.data.resource.lang}",
        HttpHeaders.authorizationHeader: "bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    ).then((onValue) {
      if (onValue.toString().isNotEmpty) {
        return AngkutUangJalanSummaryViewModel.fromJson(json.decode(onValue));
      } else {
        return null;
      }
    }).catchError((onError) {
      throw onError;
    });
  }

  static Future<AngkutUangJalanSummaryViewModel> setFinishUangJalan({
    @required String token,
    @required int summaryId,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.post(
      System.data.apiEndPointUtil.setFinishUangJalan(summaryId: summaryId),
      headers: {
        "lang": "${System.data.resource.lang}",
        HttpHeaders.authorizationHeader: "bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    ).then((onValue) {
      if (onValue.toString().isNotEmpty) {
        return AngkutUangJalanSummaryViewModel.fromJson(json.decode(onValue));
      } else {
        return null;
      }
    }).catchError((onError) {
      throw onError;
    });
  }
}
