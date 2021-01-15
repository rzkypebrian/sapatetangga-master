import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:convert/convert.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

class NetworkUtil {
  Future<dynamic> get(
    String url, {
    Map<String, String> headers,
    ValueChanged<http.Response> on401,
    String Function() on408,
    bool useTimeOutLimt = true,
    Duration timeOutLimit,
  }) {
    ModeUtil.debugPrint("GET $url");
    var request = http
        .get(
      url,
      headers: headers,
    )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode != 200) {
        switch (statusCode) {
          case 401:
            on401 != null ? on401(response) : this.on401(response);
            break;
          default:
            throw response;
        }
      }
      return res;
    }).catchError((onError) {
      print(onError);
      errorHandLing(onError);
    });

    if (useTimeOutLimt) {
      return request.timeout(timeOutLimit ?? Duration(seconds: 30),
          onTimeout: () async {
        throw on408 != null ? on408() : this.on408();
      });
    } else {
      return request;
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, String> headers,
    Map<String, dynamic> body,
    encoding,
    bool boolListBodies = false,
    List bodies,
    Duration timeOutLimit,
    ValueChanged<http.Response> on401,
    ValueChanged<http.Response> on403,
    String Function() on408,
  }) {
    ModeUtil.debugPrint("POST $url");
    var a = json.encode(body);
    ModeUtil.debugPrint(a);
    return http
        .post(url,
            body: json.encode(boolListBodies ? bodies : body),
            headers: headers,
            encoding: encoding)
        .then(
      (http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;
        if (statusCode != 200) {
          switch (statusCode) {
            case 401:
              on401 != null ? on401(response) : this.on401(response);
              break;
            case 403:
              on403 != null ? on403(response) : this.on403(response);
              break;
            default:
              throw response;
          }
        }
        return res;
      },
    ).catchError(
      (onError) {
        errorHandLing(onError);
      },
    ).timeout(timeOutLimit ?? Duration(seconds: 30), onTimeout: () async {
      throw on408 != null ? on408() : this.on408();
    });
  }

  Future<dynamic> multipartRequest(
    String url, {
    String user,
    TypeMultipartFile typeMultipartFile,
    String path,
    String field = "picture",
    Duration timeOutLimit,
    Map<String, String> headers,
  }) async {
    var _http = http.MultipartRequest(
      "POST",
      Uri.parse(url),
    )..fields["user"] = user;

    if (typeMultipartFile == TypeMultipartFile.AsStream) {
      _http.files.add(
        http.MultipartFile(
          field,
          File(path).readAsBytes().asStream(),
          File(path).lengthSync(),
          filename: path.split("/").last,
        ),
      );
    } else if (typeMultipartFile == TypeMultipartFile.FromBytes) {
      _http.files.add(
        http.MultipartFile.fromBytes(
          field,
          File(path).readAsBytesSync(),
          filename: path.split("/").last,
        ),
      );
    } else if (typeMultipartFile == TypeMultipartFile.FromPath) {
      _http.files.add(
        await http.MultipartFile.fromPath(
          field,
          path,
        ),
      );
    }

    return _http
        .send()
        .then((http.StreamedResponse value) => value)
        .catchError((onError) {
      errorHandLing(onError);
    }).timeout(timeOutLimit ?? Duration(seconds: 30), onTimeout: () async {
      throw on408 != null ? on408() : this.on408();
    });
  }

  ///Generate MD5 hash
  generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  static String readError(Map<String, dynamic> json) {
    try {
      return json['Message'].toString();
    } catch (e) {
      return "Login Error";
    }
  }

  void on401(http.Response response) {
    if (System.data.unAuthorizeRouteName != null) {
      if (System.data.onUnAuthorized != null) {
        System.data.onUnAuthorized();
      } else {
        System.data.routes.pushNamedAndRemoveUntil(
          System.data.navigatorKey.currentContext,
          System.data.unAuthorizeRouteName,
          System.data.unAuthorizeRouteNameLimit ?? "",
        );
      }
    } else {
      throw response;
    }
  }

  void on403(http.Response response) {
    throw response;
  }

  String on408() {
    return System.data.resource.requestTimeOut;
  }

  void errorHandLing(dynamic error) {
    if (error.toString().contains("SocketException")) {
      throw (System.data.resource.connectionError);
    } else {
      throw (error);
    }
  }
}

enum TypeMultipartFile {
  FromPath,
  FromBytes,
  AsStream,
}
