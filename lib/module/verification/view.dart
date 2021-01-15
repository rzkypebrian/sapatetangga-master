import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/component/timerCountDownComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'presenter.dart';

/// module_sbbi_accountVerification
class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DecoratedBox(
        decoration: decoration(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar(),
          body: Stack(
            children: [
              body(),
              circularProgressIndicator(loadingController),
            ],
          ),
        ),
      ),
    );
  }

  Decoration decoration() {
    return BoxDecoration(
      color: Colors.white,
    );
  }

  Widget body() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title(),
          message(
            message:
                System.data.resource.checkYourInboxEnter6DigitActivationCode,
            phonNumber: widget.phoneNumber,
          ),
          verificationBox(),
          timerContainer(),
          bottonSubmit(),
        ],
      ),
    );
  }

  Widget timerContainer() {
    return widget.withTimer && (startTimer == true)
        ? Container(
            margin: EdgeInsets.only(top: 15, bottom: 20),
            child: Center(
              child: TimerCountDownComponent(
                controller: timerCountDownController,
                child: (time) {
                  if (time.duration.inMilliseconds <= 0) {
                    return timerCountDownFinish(time);
                  } else {
                    return timerCountDown(time);
                  }
                },
              ),
            ),
          )
        : Container();
  }

  Widget timerCountDown(TimerCountDown time) {
    return Text(
      "${time.duration.inMinutes.toString().padLeft(2, "0")} : ${(time.duration.inSeconds - (Duration(minutes: time.duration.inMinutes).inSeconds)).toString().padLeft(2, "0")}",
      style: System.data.textStyleUtil.mainLabel(),
    );
  }

  Widget timerCountDownFinish(TimerCountDown time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "${System.data.resource.didnotReceiveVerificationCode}",
          style: System.data.textStyleUtil.mainLabel(),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            resend();
          },
          child: Text(
            "${System.data.resource.resend}",
            style: System.data.textStyleUtil.linkLabel(),
          ),
        )
      ],
    );
  }

  Widget bottonSubmit() {
    return BottonComponent.roundedButton(
        onPressed: () {
          if (loadingController.onLoading == false) {
            next();
          }
        },
        colorBackground: System.data.colorUtil.primaryColor,
        textstyle: System.data.textStyleUtil.mainTitle(),
        text: "${System.data.resource.next}");
  }

  PreferredSizeWidget appBar() {
    return BottonComponent.customAppBar1(
      title: System.data.resource.verification,
      context: context,
      actionText: "",
      titleColor: System.data.colorUtil.secondaryColor,
      backButtonColor: System.data.colorUtil.lightTextColor,
      actionTextStyle: System.data.textStyleUtil.mainLabel(),
      actionTextColor: System.data.colorUtil.secondaryColor,
      titleStyle: System.data.textStyleUtil.mainTitle(),
      backgroundColor: System.data.colorUtil.primaryColor,
    );
  }

  Widget circularProgressIndicator(
      CircularProgressIndicatorController controller) {
    return CircularProgressIndicatorComponent(
      controller: controller,
    );
  }

  Widget title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          System.data.resource.verification,
          style: System.data.textStyleUtil.pageTitle(),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget message({String message, String phonNumber}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$message  ${widget.scurePhoneNUmber ? secureNumber(phonNumber) : phonNumber}",
          style: System.data.textStyleUtil.mainLabel(),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget verificationBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listPinInput(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  List<Widget> listPinInput() {
    return <Widget>[
      input(
        controller: pin1Controller,
        nextController: pin2Controller,
        focusNode: pin1Focus,
        stateInput: pin1State,
        focusNodeNext: pin2Focus,
        focusNodeBack: new FocusNode(),
      ),
      input(
        controller: pin2Controller,
        nextController: pin3Controller,
        stateInput: pin2State,
        focusNode: pin2Focus,
        focusNodeNext: pin3Focus,
        focusNodeBack: pin1Focus,
      ),
      input(
        controller: pin3Controller,
        nextController: pin4Controller,
        focusNode: pin3Focus,
        stateInput: pin3State,
        focusNodeNext: pin4Focus,
        focusNodeBack: pin2Focus,
      ),
      input(
        controller: pin4Controller,
        nextController: pin5Controller,
        focusNode: pin4Focus,
        stateInput: pin4State,
        focusNodeNext: pin5Focus,
        focusNodeBack: pin3Focus,
      ),
      input(
        controller: pin5Controller,
        nextController: pin6Controller,
        focusNode: pin5Focus,
        stateInput: pin5State,
        focusNodeNext: pin6Focus,
        focusNodeBack: pin4Focus,
      ),
      input(
          controller: pin6Controller,
          nextController: null,
          focusNode: pin6Focus,
          stateInput: pin6State,
          focusNodeNext: null,
          focusNodeBack: pin5Focus),
    ];
  }

  Widget input({
    @required TextEditingController controller,
    @required TextEditingController nextController,
    @required FocusNode focusNode,
    @required FocusNode focusNodeNext,
    @required FocusNode focusNodeBack,
    @required StateInput stateInput,
  }) {
    return Container(
        width: 50,
        margin: EdgeInsets.only(left: 2.5, right: 2.5),
        // height: 20,
        child: RawKeyboardListener(
          focusNode: new FocusNode(),
          onKey: (key) {
            print(key);
          },
          child: InputComponent.inputTextWithCorner(
              textAlign: TextAlign.center,
              backgroundColor: System.data.colorUtil.inputTextBackground,
              obscureText: widget.obscureText,
              borderInputGray: System.data.colorUtil.borderInputColor,
              corner: 5,
              fontColor: System.data.colorUtil.darkTextColor,
              stateInput: stateInput,
              controller: controller,
              onChanged: (val) {
                if (val.length < 1) {
                  FocusScope.of(context).requestFocus(focusNodeBack);
                } else {
                  controller.text = val.trim().substring(val.length - 1);
                  FocusScope.of(context).requestFocus(focusNodeNext);
                }
              },
              textInputAction: TextInputAction.next,
              focusnode: focusNode,
              keyboardType: TextInputType.number),
        ));
  }
}
