import 'package:enerren/model/AccountModel.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:http/http.dart' as http;
import 'package:enerren/module/verification/main.dart';

mixin SieradPresenter on PresenterState {
  @override
  void resend() {
    AccountModel.checkAccount(
            username: System.data.global.newAccount.username,
            isResetPassword: false,
            token: "")
        .then((onValue) {
      ModeUtil.debugPrint("new verificationCode ${onValue.otpCode}");
      super.verificationCode = onValue.otpCode;
      super.timerCountDownController.reset();
      super.timerCountDownController.start();
    }).catchError((onError) {
      try {
        http.Response error = onError;
        loadingController.stopLoading(
            message:
                "${error.body.isNotEmpty ? error.body : error.statusCode}");
      } catch (e) {
        loadingController.stopLoading(message: "$onError");
      }
    });
  }
}
