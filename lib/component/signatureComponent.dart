import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class SignatureComponent extends StatelessWidget {
  final SignatureComponentController controller;
  final ValueWidgetBuilder<SignatureComponentValue> builder;
  final VoidCallback onSign;
  final double strokeWidth;
  final CustomPainter backgroundPainter;

  const SignatureComponent({
    Key key,
    this.controller,
    this.onSign,
    this.builder,
    this.strokeWidth = 2.0,
    this.backgroundPainter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SignatureComponentValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        return builder != null
            ? builder(context, value, signaturePad(value))
            : Container(
                width: double.infinity,
                child: Container(
                  child: signaturePad(value),
                ),
              );
      },
    );
  }

  Widget signaturePad(SignatureComponentValue value) {
    return Signature(
      color: Colors.black, // Color of the drawing path
      strokeWidth: 2.0, // with
      backgroundPainter:
          backgroundPainter, // Additional custom painter to draw stuff like watermark
      onSign: () {
        controller.onSign(onSign);
      }, // Callback called on user pan drawing
      key: value
          .sign, // key that allow you to provide a GlobalKey that'll let you retrieve the image once user has signed
    );
  }
}

class SignatureComponentController
    extends ValueNotifier<SignatureComponentValue> {
  SignatureComponentController({SignatureComponentValue value})
      : super(value == null ? SignatureComponentValue() : value);

  static const baseImageEncoder = "data:image/png;base64,";

  void setState(VoidCallback fn) {
    fn();
    notifyListeners();
  }

  void clear() {
    value.sign.currentState.clear();
    value.base64File = "";
    value.isSigngatured = false;
    notifyListeners();
  }

  void onSign(VoidCallback onSignProses) {
    value.isSigngatured = true;
    notifyListeners();
    readData().then((onValue) {
      if (onSignProses != null) onSignProses();
    });
  }

  Future<bool> readData() async {
    var image = await value.sign.currentState.getData();
    var data = await image.toByteData(format: ui.ImageByteFormat.png);
    value.base64File =
        baseImageEncoder + base64.encode(data.buffer.asUint8List());
    notifyListeners();
    if (value.base64File == baseImageEncoder) {
      return false;
    } else {
      return true;
    }
  }

  String get getBase64 {
    if (value.isSigngatured) {
      return value.base64File;
    } else {
      return "";
    }
  }
}

class SignatureComponentValue {
  final sign = GlobalKey<SignatureState>();
  String base64File;
  bool isSigngatured = false;

  SignatureComponentValue({
    this.base64File = "",
    this.isSigngatured = false,
  });
}
