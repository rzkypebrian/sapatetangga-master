import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/util/TextStyleUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DecorationComponent {
  static Decoration backgroundDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.3, 9],
        colors: [
          System.data.colorUtil.greenColorBackGround,
          System.data.colorUtil.primaryColor,
        ],
      ),
    );
  } //

  static Widget containerWithDecoration({
    Widget child,
    String image1 = "assets/sample/egg_1.svg",
    String image2 = "assets/sample/egg_2.svg",
    String image3 = "assets/sample/egg_3.svg",
    String image4 = "assets/sample/egg_4.svg",
  }) {
    return Container(
      decoration: backgroundDecoration(),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset("$image3")),
          Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset("$image4")),
          Align(
              alignment: Alignment.topLeft, child: SvgPicture.asset("$image1")),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SvgPicture.asset(
                "$image2",
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: child,
          )
        ],
      ),
    );
  } //

  static Widget listTileDecoretion({
    Widget widget,
    double height = 80,
    double radius = 0,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 7, bottom: 7),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: System.data.colorUtil.secondaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: System.data.colorUtil.darkTextColor.withOpacity(.5),
              offset: Offset(.0, 3),
            ),
          ],
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.topRight,
          //   stops: [.1, .9],
          //   colors: [
          //     SavedDataUtil.data.colors.greenColorBackGround,
          //     SavedDataUtil.data.colors.primaryColor,
          //   ],
          // ),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                child: SvgPicture.asset(
                  "assets/left_aksen.svg",
                  color: System.data.colorUtil.greenColorBackGround,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: widget,
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget circularProgressDecoration({
    CircularProgressIndicatorController controller,
    Alignment aligment,
  }) {
    return CircularProgressIndicatorComponent(
      width: 150,
      controller: controller,
      flareAssets: "assets/flares/sample/loading_beton.flr",
      flareAnimation: "loading2",
      margin: EdgeInsets.only(
        bottom: 50,
      ),
      messageMargin: EdgeInsets.only(
        bottom: 30,
      ),
      textStyleError: System.data.textStyleUtil.mainLabel(
        color: System.data.colorUtil.lightTextColor,
      ),
      backgroundNonerrorColor: System.data.colorUtil.primaryColor,
      textStyleNonError: System.data.textStyleUtil.mainLabel(
        color: System.data.colorUtil.lightTextColor,
      ),
    );
  }

  static Widget topMessageDecoration({
    Color backgroundColor = Colors.red,
    String message,
    TextStyleUtil messageStyle,
    Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 50,
      width: double.infinity,
      color: backgroundColor,
      child: child ??
          Center(
            child: Text(
              "$message",
              style: messageStyle ??
                  System.data.textStyleUtil.mainLabel(
                    color: System.data.colorUtil.lightTextColor,
                  ),
            ),
          ),
    );
  }
}
