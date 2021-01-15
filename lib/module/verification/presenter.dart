import 'dart:math';

import 'package:enerren/component/InputComponent.dart';
import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/component/timerCountDownComponent.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import '../../model/ginotaModel.dart' as ginota;
import 'view.dart';

/// module_sbbi_accountVerification
/// verification phone number lewat sms melalui layanan sms cloud ginnota
/// kode verifikasi akan di generate dan dikirim ke ginnota
/// kemudian akan dicocokan dengan kode yang diinput oleh user
///
class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final String apiKey;
  final String apiSecret;
  final String senderName;
  final String phoneNumber;
  final ValueChanged<String> onVerificationValid;
  final VoidCallback onVerificationFailed;
  final bool sentSms;
  final String verificationCode;
  final bool obscureText;
  final bool scurePhoneNUmber;
  final bool withTimer;
  final Duration duration;

  const Presenter({
    Key key,
    this.phoneNumber,
    this.onVerificationValid,
    this.apiKey,
    this.apiSecret,
    this.senderName,
    this.onVerificationFailed,
    this.view,
    this.sentSms = true,
    this.verificationCode,
    this.obscureText = true,
    this.scurePhoneNUmber = false,
    this.withTimer = false,
    this.duration,
  }) : super(key: key);

  createState() {
    if (view != null) {
      return view;
    } else {
      return View();
    }
  }
}

abstract class PresenterState extends State<Presenter> {
  bool onLoading = false;
  bool startTimer = true;
  String errorMessage = "";
  String pin;

  String verificationCode;

  CircularProgressIndicatorController loadingController =
      CircularProgressIndicatorController();

  TimerCountDownController timerCountDownController =
      new TimerCountDownController();

  InputComponentTextEditingController pin1Controller =
      InputComponentTextEditingController();
  InputComponentTextEditingController pin2Controller =
      InputComponentTextEditingController();
  InputComponentTextEditingController pin3Controller =
      InputComponentTextEditingController();
  InputComponentTextEditingController pin4Controller =
      InputComponentTextEditingController();
  InputComponentTextEditingController pin5Controller =
      InputComponentTextEditingController();
  InputComponentTextEditingController pin6Controller =
      InputComponentTextEditingController();

  StateInput pin1State;
  StateInput pin2State;
  StateInput pin3State;
  StateInput pin4State;
  StateInput pin5State;
  StateInput pin6State;

  bool isValid;

  final FocusNode pin1Focus = FocusNode();
  final FocusNode pin2Focus = FocusNode();
  final FocusNode pin3Focus = FocusNode();
  final FocusNode pin4Focus = FocusNode();
  final FocusNode pin5Focus = FocusNode();
  final FocusNode pin6Focus = FocusNode();

  ginota.GinotaModel ginotaModel;

  @override
  void initState() {
    super.initState();
    ginotaModel = ginota.GinotaModel(
      apiKey: widget.apiKey,
      apiSecret: widget.apiSecret,
    );
    loadingController.startLoading();
    sendSms();
    if (widget.withTimer == true) {
      timerCountDownController.reset(duration: widget.duration);
      timerCountDownController.start();
    }
    pin1Controller.addListener(() {});
  }

  void next() {
    isValid = true;
    reset();
    if (pin1Controller.text.isEmpty || pin1Controller.text.length < 1) {
      isValid = false;
      ModeUtil.debugPrint("Pin 1");
      pin1State = StateInput.Error;
    } else if (pin2Controller.text.isEmpty || pin2Controller.text.length < 1) {
      isValid = false;
      ModeUtil.debugPrint("Pin 2");
      isValid = false;
      pin2State = StateInput.Error;
    } else if (pin3Controller.text.isEmpty || pin3Controller.text.length < 1) {
      isValid = false;
      ModeUtil.debugPrint("Pin 3");
      isValid = false;
      pin3State = StateInput.Error;
    } else if (pin4Controller.text.isEmpty || pin4Controller.text.length < 1) {
      isValid = false;
      ModeUtil.debugPrint("Pin 4");
      isValid = false;
      pin4State = StateInput.Error;
    } else if (pin5Controller.text.isEmpty || pin5Controller.text.length < 1) {
      isValid = false;
      ModeUtil.debugPrint("Pin 5");
      isValid = false;
      pin5State = StateInput.Error;
    } else if (pin6Controller.text.isEmpty || pin6Controller.text.length < 1) {
      isValid = false;
      ModeUtil.debugPrint("Pin 6");
      isValid = false;
      pin6State = StateInput.Error;
    }
    if (isValid == false) {
      ModeUtil.debugPrint("input failed");
    } else {
      readPin();
      ModeUtil.debugPrint("verification code $verificationCode == $pin");
      if (verificationCode == pin) {
        onValid();
      } else {
        onFailed();
      }
    }
  }

  void onValid() {
    loadingController.startLoading();
    if (widget.onVerificationValid != null) {
      widget.onVerificationValid(pin);
      loadingController.stopLoading();
    } else {
      onVerificationValid();
      loadingController.stopLoading();
    }
  }

  void onFailed() {
    loadingController.startLoading();
    if (widget.onVerificationFailed != null) {
      widget.onVerificationFailed();
      loadingController.stopLoading();
    } else {
      onVerificationFailed();
      loadingController.stopLoading();
    }
  }

  void onVerificationValid() {
    ModeUtil.debugPrint("Verification valid");
    loadingController.stopLoading();
  }

  void onVerificationFailed() {
    ModeUtil.debugPrint("verification failed");
    loadingController.stopLoading(
        message: System.data.resource.incorrectVerificationCode);
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void onchange(
      String val, FocusNode focusNode, TextEditingController controller) {
    // print(val.length);
    print(controller.text);
    if (val.length < 2) {
      FocusScope.of(context).requestFocus(focusNode);
    }
  }

  String readPin() {
    pin = "";
    pin = "${pin1Controller.text}";
    pin = pin + "${pin2Controller.text}";
    pin = pin + "${pin3Controller.text}";
    pin = pin + "${pin4Controller.text}";
    pin = pin + "${pin5Controller.text}";
    pin = pin + "${pin6Controller.text}";

    return pin;
  }

  void reset() {
    setState(() {
      pin1State = StateInput.Enable;
      pin2State = StateInput.Enable;
      pin3State = StateInput.Enable;
      pin4State = StateInput.Enable;
      pin5State = StateInput.Enable;
      pin6State = StateInput.Enable;
    });
  }

  void sendSms() {
    if (widget.sentSms) {
      ModeUtil.debugPrint("generate verification code");
      verificationCode = widget.verificationCode ?? get6digitNumber();
      ModeUtil.debugPrint("send sms");
      ginotaModel
          .send(ginota.GinotaMessage(
        content:
            "$verificationCode ${System.data.resource.yourVerificationCodeIs}",
        dstAddr: widget.phoneNumber,
        flash: false,
        srcAddr: widget.senderName,
      ))
          .then((onValue) {
        ModeUtil.debugPrint("sms sent");
        loadingController.stopLoading();
      }).catchError((onError) {
        ModeUtil.debugPrint("sms sent error ");
        loadingController.stopLoading(
            message: "cannot send SMS please try again");
      });
    } else {
      ModeUtil.debugPrint("not set to sent SMS");
      verificationCode = widget.verificationCode;
      loadingController.stopLoading();
    }
    ModeUtil.debugPrint(verificationCode);
  }

  String get6digitNumber() {
    ModeUtil.debugPrint("get randowm 6 digit number");
    String numberString = "";
    var rng = new Random();
    for (var i = 0; i < 6; i++) {
      numberString = "$numberString${rng.nextInt(9)}";
    }
    ModeUtil.debugPrint("verification code id $numberString ");
    return numberString;
  }

  String secureNumber(String phoneNumber) {
    var re = RegExp(r'\d(?!\d{0,2}$)');
    return phoneNumber.replaceAll(re, "*");
  }

  void resend() {
    return ModeUtil.debugPrint("resend() override this fuction");
  }
}
