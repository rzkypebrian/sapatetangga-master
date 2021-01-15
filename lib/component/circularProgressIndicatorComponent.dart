import 'dart:async';

import 'package:enerren/util/SystemUtil.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorComponent extends StatelessWidget {
  final CircularProgressIndicatorController controller;
  final double height;
  final double width;
  final AlignmentGeometry aligment;
  final AlignmentGeometry messageAligment;
  final String flareAssets;
  final String flareAnimation;
  final Color backgroundErrorColor;
  final Color backgroundNonerrorColor;
  final TextStyle textStyleError;
  final TextStyle textStyleNonError;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry messageMargin;
  final bool coverScreen;
  final bool coverScreenColor;

  CircularProgressIndicatorComponent({
    this.controller,
    this.height = 100,
    this.width = 100,
    this.aligment = Alignment.bottomCenter,
    this.flareAssets = "assets/flares/loader_comon.flr",
    this.flareAnimation = "loader",
    this.backgroundErrorColor = Colors.red,
    this.backgroundNonerrorColor = Colors.grey,
    this.textStyleError,
    this.textStyleNonError,
    this.margin,
    this.padding,
    this.messageMargin = const EdgeInsets.only(bottom: 30),
    this.messageAligment,
    this.coverScreen = true,
    this.coverScreenColor,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CircularProgressIndicatorValue>(
        valueListenable: controller,
        builder: (context, value, child) {
          print(value.onLoading);
          return value.onLoading
              ? _progressIndicatorContainer(value)
              : value.message.isNotEmpty || value.messageWidget != null
                  ? _errorMessageContainer(value)
                  : Container();
        });
  }

  Widget _progressIndicatorContainer(CircularProgressIndicatorValue value) {
    return Container(
      child: Stack(
        children: <Widget>[
          (value.coverScreen ?? coverScreen) == true
              ? Container(
                  color: (value.coverScreenColor ?? coverScreenColor) ??
                      Colors.grey.withOpacity(0.3),
                )
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 0,
                    height: 0,
                  ),
                ),
          Align(
            alignment: aligment,
            child: Container(
              margin: margin,
              padding: padding,
              child: _progressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _progressIndicator() {
    return Container(
      height: height,
      width: width,
      child: FlareActor(
        flareAssets,
        animation: flareAnimation,
        callback: (snimate) {
          // loadData();
        },
      ),
    );
  }

  Widget _errorMessageContainer(CircularProgressIndicatorValue value) {
    return Container(
      child: Align(
        alignment: value.messageAlign ?? messageAligment ?? aligment,
        child: SafeArea(
          child: Container(
            margin: margin,
            padding: padding,
            child: _errorMessageWidget(value),
          ),
        ),
      ),
    );
  }

  Widget _errorMessageWidget(CircularProgressIndicatorValue value) {
    return value.messageWidget ??
        Container(
          padding: EdgeInsets.all(10),
          margin: messageMargin,
          child: Text(
            "${value.message}",
            style: value.isError
                ? textStyleError ?? System.data.textStyleUtil.mainLabel()
                : textStyleNonError ?? System.data.textStyleUtil.mainLabel(),
          ),
          decoration: BoxDecoration(
            color:
                value.isError ? backgroundErrorColor : backgroundNonerrorColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        );
    // return AnimatedContainer(
    //   height: 50,
    //   curve: Curves.easeIn,
    //   decoration: BoxDecoration(
    //     color: Colors.red.withOpacity(value.opacity),
    //   ),
    //   duration: Duration(milliseconds: 500),
    // );
  }
}

class CircularProgressIndicatorValue {
  bool onLoading = true;
  String message = "";
  Widget messageWidget;
  bool isError = true;
  Timer timer;
  Alignment messageAlign;
  bool coverScreen;
  Color coverScreenColor;
  //setting from animation
  // double height = 0;
  // double width = 0;
  // double opacity = 0;

  CircularProgressIndicatorValue({
    bool onLoading = true,
    String message = "",
  });
}

class CircularProgressIndicatorController
    extends ValueNotifier<CircularProgressIndicatorValue> {
  CircularProgressIndicatorController({CircularProgressIndicatorValue value})
      : super(value == null ? CircularProgressIndicatorValue() : value);

  void startLoading({
    bool coverScreen,
    Color coverScreenColor,
  }) {
    print("masuk sini ${value.onLoading}");
    value.onLoading = true;
    print("masuk sini ${value.onLoading}");
    value.message = "";
    value.messageWidget = null;
    value.isError = true;
    value.messageAlign = null;
    value.coverScreen = coverScreen;
    value.coverScreenColor = coverScreenColor;
    notifyListeners();
  }

  void stopLoading(
      {String message = "",
      Widget messageWidget,
      bool isError = true,
      Duration duration = const Duration(seconds: 3),
      Alignment messageAlign,
      VoidCallback onFinishCallback}) {
    //stop message
    value.message = message;
    value.messageWidget = messageWidget;
    value.onLoading = false;
    value.isError = isError;
    value.messageAlign = messageAlign;
    value.coverScreen = null;
    value.coverScreenColor = null;
    notifyListeners();

    // Timer.periodic(Duration(milliseconds: 100), (t) {
    //   value.opacity = 1;
    //   notifyListeners();
    //   t.cancel();
    // });

    value.timer?.cancel();
    value.timer = new Timer(duration, () {
      value.message = "";
      // value.onLoading = false;
      value.isError = true;
      value.messageWidget = null;
      value.timer.cancel();
      if (onFinishCallback != null) {
        onFinishCallback();
      }
      notifyListeners();
    });
  }

  bool get onLoading {
    return this.value.onLoading;
  }
}
