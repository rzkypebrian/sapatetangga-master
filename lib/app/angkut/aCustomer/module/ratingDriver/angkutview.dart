import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/module/ratingDriver/view.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'angkutPresenter.dart';
import 'package:enerren/component/angkutDecorationComponent.dart';

class AngkutView extends View with AngkutPresenter {
  @override
  Widget bottomNavBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: BottonComponent.roundedButton(
          onPressed: () {
            submit();
          },
          height: 40,
          radius: 5,
          text: System.data.resource.save,
          colorBackground: System.data.colorUtil.primaryColor,
          textstyle: System.data.textStyleUtil.mainLabel(
              fontWeight: FontWeight.bold,
              color: System.data.colorUtil.lightTextColor,
              fontSize: System.data.fontUtil.xl)),
    );
  }

  Widget circularProgressIndicatorComponent() {
    return DecorationComponent.circularLOadingIndicator(
      controller: loadingController,
    );
  }
}
