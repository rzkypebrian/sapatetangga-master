import 'package:enerren/component/sieradDecorationComponent.dart';
import 'package:enerren/module/splashScreen/main.dart';
import 'package:enerren/util/SystemUtil.dart';
// import 'package:enerren/util/SystemUtil.dart';
// import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'sieradPresenter.dart';

class SieradView extends View with SieradPresenter {
  @override
  Widget centerLogo() {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: SvgPicture.asset("assets/sierad/logo_sreeya.svg"),
        // child: FlareActor(
        //   "assets/flares/sierad/sierad_produce.flr",
        //   animation: "play",
        //   callback: (a) {
        //     onStart();
        //   },
        // ),
      ),
    );
  }

  @override
  Widget backGround() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xff008541),
    );
  }

  @override
  Widget circularProgressIndicatorDecoration() {
    return DecorationComponent.circularProgressDecoration(
      controller: loadingController,
    );
  }

  @override
  Widget version() {
    super.versionTextStyle = TextStyle(
      color: System.data.colorUtil.lightTextColor,
    );
    return super.version();
  }
}
