import 'package:enerren/component/angkutDecorationComponent.dart';
import 'package:enerren/model/AccountModel.dart';
import 'package:enerren/module/verification/main.dart';
import 'package:enerren/util/ErrorHandlingUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';

mixin ChangePhoneNumberPresenter on PresenterState {
  @override
  void initState() {
    super.initState();
    resend();
  }

  @override
  void resend() {
    loadingController.startLoading();
    AccountModel.validatePhoneNumber(
      phoneNumber: widget.phoneNumber,
      token: System.data.global.token,
    ).then((onValue) {
      verificationCode = onValue["otpCode"];
      ModeUtil.debugPrint("new OTP = $verificationCode");
      reset();
      timerCountDownController.reset();
      timerCountDownController.start();
      loadingController.stopLoading();
    }).catchError((onError) {
      loadingController.stopLoading(
        messageAlign: Alignment.topCenter,
        messageWidget: DecorationComponent.topMessageDecoration(
          message: ErrorHandlingUtil.handleApiError(onError),
        ),
      );
    });
  }
}
