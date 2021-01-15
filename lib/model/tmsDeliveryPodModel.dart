import 'dart:convert';
import 'dart:io';

import 'package:enerren/util/NetworkUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tmsDeliveryPodModel.g.dart';

@JsonSerializable()
class TmsDeliveryPodModel {
  int destinationId;
  int driverId;
  int memberId;
  String driverName;
  String receiverName;
  String barcode;
  String receiverPhoto;
  String ePODSign;
  bool isShipmentFinish;
  List<String> productPhoto;
  double podLat;
  double podLon;
  DateTime podTime;

  TmsDeliveryPodModel({
    this.destinationId,
    this.driverId,
    this.memberId,
    this.driverName,
    this.receiverName,
    this.barcode,
    this.receiverPhoto,
    this.ePODSign,
    this.isShipmentFinish,
    this.productPhoto,
    this.podLat,
    this.podLon,
    this.podTime,
  });

  factory TmsDeliveryPodModel.fromJson(Map<String, dynamic> dataJson) =>
      _$TmsDeliveryPodModelFromJson(dataJson);

  Map<String, dynamic> toJson() => _$TmsDeliveryPodModelToJson(this);

  static Future<TmsDeliveryPodModel> set({
    @required String token,
    TmsDeliveryPodModel param,
    bool isFinish,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil
        .post(
      System.data.apiEndPointUtil.setTmsDeliveryPod(
        isPod: isFinish,
      ),
      headers: {
        "lang": "${System.data.resource.lang}",
        HttpHeaders.authorizationHeader: "bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: param.toJson(),
      encoding: Encoding.getByName("apliaction/json"),
    )
        .then((res) {
      return TmsDeliveryPodModel.fromJson(json.decode(res.toString()));
    }).catchError((onError) {
      throw onError;
    });
  }

  static Future<TmsDeliveryPodModel> get({
    @required String token,
    int destinationId,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.get(
        System.data.apiEndPointUtil.getTmsDeliveryPod(
          destinationId: destinationId,
        ),
        headers: {
          "lang": "${System.data.resource.lang}",
          HttpHeaders.authorizationHeader: "bearer $token",
        }).then((onValue) {
      return TmsDeliveryPodModel.fromJson(json.decode(onValue.toString()));
    }).catchError((onError) {
      throw onError;
    });
  }

  static Future<dynamic> setBackToPool(
      {@required String token,
      @required int driverId,
      @required int vehicleId,
      @required bool status}) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.get(
        System.data.apiEndPointUtil.setBackToPool(
          backToPool: status,
          driverId: driverId,
          vehicleId: vehicleId,
        ),
        headers: {
          "lang": "${System.data.resource.lang}",
          HttpHeaders.authorizationHeader: "bearer $token",
        }).then((onValue) {
      return onValue;
    }).catchError((onError) {
      throw onError;
    });
  }

  static Future<TmsDeliveryPodModel> getLoadingPOD({
    @required String token,
    int destinationId,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.get(
        System.data.apiEndPointUtil.getTmsLoadingPod(
          destinationId: destinationId,
        ),
        headers: {
          "lang": "${System.data.resource.lang}",
          HttpHeaders.authorizationHeader: "bearer $token",
        }).then((onValue) {
      return TmsDeliveryPodModel.fromJson(json.decode(onValue.toString()));
    }).catchError((onError) {
      throw onError;
    });
  }

  static Future<TmsDeliveryPodModel> getUnloadingPOD({
    @required String token,
    int destinationId,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.get(
        System.data.apiEndPointUtil.getTmsUnloadingPod(
          destinationId: destinationId,
        ),
        headers: {
          "lang": "${System.data.resource.lang}",
          HttpHeaders.authorizationHeader: "bearer $token",
        }).then((onValue) {
      return TmsDeliveryPodModel.fromJson(json.decode(onValue.toString()));
    }).catchError((onError) {
      throw onError;
    });
  }
}
