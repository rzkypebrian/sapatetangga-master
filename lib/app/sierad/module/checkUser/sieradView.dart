import 'package:enerren/component/sieradDecorationComponent.dart';
import 'package:enerren/module/checkUser/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SieradView extends View {
  String image1 = "assets/sierad/egg_1.svg";
  String image2 = "assets/sierad/egg_2.svg";
  String image3 = "assets/sierad/egg_3.svg";
  String image4 = "assets/sierad/egg_4.svg";

  @override
  Widget logo() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Align(
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            "assets/sierad/logo_sreeya_green.svg",
            width: 250,
          ),
        ),
      ),
    );
  }

  Widget loadingDecoration() {
    return DecorationComponent.circularProgressDecoration(
      controller: loadingController,
    );
  }

  @override
  Widget body() {
    return Stack(
      children: <Widget>[
        Container(
          child: DecorationComponent.containerWithDecoration(
            image1: image1,
            image2: image2,
            image3: image3,
            image4: image4,
            child: CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              ),
              painter: PathPainter(),
              child: Stack(
                children: <Widget>[
                  logo(),
                  boxInput(),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            child: SvgPicture.asset("assets/poweredby_tms.svg"),
          ),
        )
      ],
    );
  }
}
