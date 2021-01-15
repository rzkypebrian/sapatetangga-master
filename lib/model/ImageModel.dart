import 'dart:convert';
import 'dart:io';

import 'package:enerren/model/AccountModel.dart';
import 'package:enerren/util/NetworkUtil.dart';
import 'package:enerren/util/SystemUtil.dart';

class ImageModel {
  ImageModel();

  static Future<AccountModel> uploadImage({
    String token,
    String path,
    TypeMultipartFile typeMultipartFile,
    String username,
  }) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil.multipartRequest(
      System.data.apiEndPointUtil.uploadImage(),
      headers: {
        "lang": "${System.data.resource.lang}",
        HttpHeaders.authorizationHeader: "bearer $token",
      },
    ).then((onValue) {
      if (onValue.toString().isNotEmpty) {
        return AccountModel.fromJson(json.decode(onValue));
      } else {
        return AccountModel();
      }
    }).catchError((onError) {
      throw onError;
    });
  }
}
