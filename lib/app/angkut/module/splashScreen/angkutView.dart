import 'package:enerren/component/angkutDecorationComponent.dart';
import 'package:enerren/module/splashScreen/view.dart';
// import 'package:enerren/util/SystemUtil.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'angkutPresenter.dart';

class AngkutView extends View with AngkutPresenter {
  @override
  Widget backGround() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
    );
  }

  Widget centerLogo() {
    return Center(
      child: Container(
        child: FlareActor(
          "assets/flares/angkut/splash_angkut.flr",
          animation: "play",
          callback: (a) => onStart(),
        ),
      ),
    );
  }

  // @override
  // Widget centerLogo() {
  //   return Center(
  //     child: Container(
  //       width: MediaQuery.of(context).size.width / 2,
  //       child: SvgPicture.asset(
  //         "assets/angkut/logo_angkut_transparent.svg",
  //         color: System.data.colorUtil.primaryColor,
  //       ),
  //     ),
  //   );
  // }

  Widget circularProgressIndicatorDecoration() {
    return DecorationComponent.circularLOadingIndicator(
      controller: super.loadingController,
      lightMode: true,
    );
  }
}
