import 'dart:convert';

import 'package:enerren/model/AccountModel.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:enerren/module/verification/presenter.dart';

mixin NewLoginPresenter on PresenterState {
  ValueChanged<Map<String, dynamic>> onSuccessLogin;

  @override
  void onVerificationValid() {
    ModeUtil.debugPrint(
        "override onVerification valid to process new login ${System.data.global.newAccount.username} ${System.data.global.newAccount.password} ${System.data.global.mmassagingToken}");
    AccountModel.login(
      username: System.data.global.newAccount.username,
      password: System.data.global.newAccount.password,
      token: System.data.global.token,
      deviceId: System.data.global.mmassagingToken,
      otp: verificationCode,
    ).then((onValue) {
      loadingController.stopLoading();
      if (onSuccessLogin != null) {
        onSuccessLogin(onValue);
      }
    }).catchError(
      (onError) {
        try {
          loadingController.stopLoading(
              message:
                  "${onError.body.isNotEmpty ? onError.body : onError.statusCode}");
        } catch (e) {
          loadingController.stopLoading(
            message: "$onError",
          );
        }
      },
    );
  }

  @override
  void resend() {
    loadingController.startLoading();
    AccountModel.login(
      username: System.data.global.newAccount.username,
      password: System.data.global.newAccount.password,
      token: "",
      deviceId: System.data.global.mmassagingToken,
      otp: "",
    ).then((onValue) {
      loadingController.stopLoading();
      if (onSuccessLogin != null) {
        onSuccessLogin(onValue);
      }
    }).catchError((onError) {
      try {
        http.Response error = onError;
        if (error.statusCode == 403) {
          verificationCode =
              AccountModel.fromJson(json.decode(error.body)).otpCode;
          reset();
          timerCountDownController.reset();
          timerCountDownController.start();
          loadingController.stopLoading();
        } else {
          loadingController.stopLoading(
              message:
                  "${error.body.isNotEmpty ? error.body : error.statusCode}");
        }
      } catch (e) {
        loadingController.stopLoading(
          message: "$onError",
        );
      }
    });
  }
}
