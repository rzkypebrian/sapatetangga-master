import 'package:enerren/component/tmsDecorationComponent.dart';
import 'package:enerren/module/splashScreen/main.dart';
import 'package:enerren/util/SystemUtil.dart';
// import 'package:enerren/util/SystemUtil.dart';
// import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'tmsPresenter.dart';

class TmsView extends View with TmsPresenter {
  @override
  Widget centerLogo() {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: SvgPicture.asset("assets/tms/logo_tms.svg"),
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
      color: Colors.white,
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
