import 'package:enerren/component/AngkutDecorationComponent.dart';
import 'package:enerren/model/AccountModel.dart';
import 'package:enerren/module/verification/presenter.dart';
import 'package:enerren/util/ErrorHandlingUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';

mixin ForgotPasswordPresenter on PresenterState {
  @override
  void resend() {
    loadingController.startLoading();
    AccountModel.checkAccount(
      username: System.data.global.newAccount.username,
      token: "",
      isResetPassword: true,
    ).then((onValue) {
      verificationCode = onValue.otpCode;
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
