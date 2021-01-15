import 'package:component_icons/font_awesome.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'CustomBoxShadow.dart';
import 'package:flutter/material.dart';

//update
class BottonComponent {
  static GestureDetector mainBotton({
    @required String text,
    @required VoidCallback onTap,
    double fontSize,
    FontWeight fontWeight,
    Color textColor,
    TextStyle textStyle,
    Color borderColor,
    Color backgroundColor = Colors.transparent,
    double cornerRadius = 10,
  }) {
    /// design botton utama
    /// bentuk bottonnya transparan dengan border berwarna hijau neon (memiliki shadow)
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              CustomBoxShadow(
                  color: borderColor ?? System.data.colorUtil.primaryColor,
                  blurRadius: 6.0,
                  blurStyle: BlurStyle.outer),
            ],
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            border: Border.all(
                width: 3,
                color: borderColor ?? System.data.colorUtil.primaryColor)),
        child: Center(
          child: Text(
            "$text",
            style: textStyle ??
                TextStyle(
                    fontWeight: fontWeight ?? FontWeight.bold,
                    color: textColor ?? Colors.white,
                    fontFamily: System.data.fontUtil.primary,
                    fontSize: fontSize ?? System.data.fontUtil.l),
          ),
        ),
      ),
    );
  }

  /// custom app bar dengan komposisi
  /// dibagian kiri ada tombol back dengan icon arrow dengan action tap [onBack]
  /// disebelahnya tombol tersebut ada [actionText] yang dapat di ganti
  /// ditengahnya ada text [title] halaman dan
  /// dikanannya ada [rightWidget]
  /// masukan elevation 0 untuk appbar transparant
  static AppBar customAppBar1(
      {@required BuildContext context,
      @required String actionText,
      String title = "",
      Widget rightWidget,
      VoidCallback onBack,
      double elevetion = 1,
      Color backgroundColor,
      Color titleColor,
      TextStyle titleStyle,
      Color backButtonColor,
      Color actionTextColor,
      bool canback = true,
      TextStyle actionTextStyle}) {
    return AppBar(
      centerTitle: false,
      leading: Navigator.of(context).canPop() && canback == true
          ? Container(
              width: 40,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              child: GestureDetector(
                onTap: () {
                  onBack != null ? onBack() : System.data.routes.pop(context);
                },
                child: Center(
                  child: Icon(
                    FontAwesomeLight(FontAwesomeId.fa_arrow_left),
                    // size: FontUtil.xlPlus,
                    color:
                        backButtonColor ?? System.data.colorUtil.primaryColor,
                  ),
                ),
              ),
            )
          : null,
      flexibleSpace: Container(
        child: Center(
          child: SafeArea(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Text(
                      "$title",
                      style: titleStyle ??
                          TextStyle(
                              color: titleColor ??
                                  System.data.colorUtil.primaryColor,
                              fontFamily: System.data.fontUtil.primary,
                              fontSize: System.data.fontUtil.lPlus,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Navigator.of(context).canPop() && canback == true
                      //     ? Container(
                      //         width: 40,
                      //         padding: EdgeInsets.all(0),
                      //         margin: EdgeInsets.all(0),
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             onBack != null
                      //                 ? onBack()
                      //                 : SavedDataUtil.data.routes.pop(context);
                      //           },
                      //           child: Center(
                      //             child: Icon(
                      //               FontAwesomeLight(FontAwesomeId.fa_arrow_left),
                      //               size: FontUtil.lPlus,
                      //               color: backButtonColor ?? ColorUtil.primaryColor,
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     :
                      Container(),
                      Container(
                        child: rightWidget ?? Container(),
                      ),
                      // Navigator.of(context).canPop()
                      //     ? Expanded(
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: <Widget>[
                      //             GestureDetector(
                      //               onTap: () {
                      //                 onBack != null
                      //                     ? onBack()
                      //                     : SavedDataUtil.data.routes.pop(context);
                      //               },
                      //               child: Text(
                      //                 "$actionText",
                      //                 style: actionTextStyle ??
                      //                     TextStyleUtil.linkLabel(
                      //                         fontSize: FontUtil.lPlus,
                      //                         color: actionTextColor),
                      //               ),
                      //             ),
                      //             Container(
                      //               child: rightWidget ?? Container(),
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     : Container(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevetion,
    );
  }

  static Widget neonButton({
    Widget child,
    String text = "text",
    Color borderColor,
    VoidCallback onTap,
    EdgeInsetsGeometry margin,
  }) {
    return Container(
        height: 35,
        margin: margin ?? EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 95,
              child: BottonComponent.roundedButton(
                  onPressed: () {
                    onTap();
                  },
                  boxShadow: <CustomBoxShadow>[
                    CustomBoxShadow(
                      blurRadius: 5,
                      blurStyle: BlurStyle.outer,
                      color: borderColor ?? System.data.colorUtil.primaryColor,
                    )
                  ],
                  child: child == null
                      ? Text(
                          "$text",
                          style: System.data.textStyleUtil.mainLabel(
                            fontWeight: FontWeight.bold,
                            fontSize: System.data.fontUtil.l,
                          ),
                        )
                      : child,
                  colorBackground: Colors.transparent,
                  radius: 50,
                  border: Border.all(
                    color: borderColor ?? System.data.colorUtil.primaryColor,
                    style: BorderStyle.solid,
                    width: 4,
                  )),
            )
          ],
        ));
  }

  static Widget roundedButton(
      {String text = "", //
      Color colorBackground = Colors.blueAccent,
      double radius = 5,
      double fontSize = 14,
      String fontFamily,
      Color textColor = Colors.white,
      double height = 50,
      double width = double.infinity,
      Border border,
      TextStyle textstyle,
      Widget child,
      VoidCallback onPressed,
      List<BoxShadow> boxShadow}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: new BoxDecoration(
          border: border,
          color: colorBackground,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          boxShadow: boxShadow,
        ),
        child: Center(
          child: child != null
              ? child
              : Text(
                  "$text",
                  style: textstyle ??
                      TextStyle(
                          color: textColor,
                          fontSize: fontSize,
                          fontFamily: fontFamily),
                ),
        ),
      ),
    );
  }
}
