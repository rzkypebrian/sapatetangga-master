import 'package:enerren/component/sieradDecorationComponent.dart';
import 'package:enerren/module/password/presenter.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';

import 'package:enerren/module/password/view.dart';
import 'package:enerren/app/sierad/module/password/sieradPresenter.dart';

class SieradView extends View with SieradPresenter {

  @override
  Widget headerPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${System.data.resource.lastStep}",
          style: System.data.textStyleUtil.mainLabel(),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget circularProgressIndicator() {
    return DecorationComponent.circularProgressDecoration(
      controller: loadingController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: decoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: getAppBar(),
        bottomNavigationBar: bottomNavigationBar(),
        body: Stack(
          children: <Widget>[
            Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
                margin: EdgeInsets.only(top: 20),
                height: widget.passwordState == PasswordState.CreatePassword ||
                        widget.passwordState == PasswordState.ResetPassword
                    ? 300
                    : 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(.5),
                      offset: Offset(.0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    ListView(
                      children: getComponent(),
                    ),
                  ],
                )),
            circularProgressIndicator()
          ],
        ),
      ),
    );
  }

  Decoration decoration() {
    return BoxDecoration(
      color: System.data.colorUtil.scaffoldBackgroundColor,
    );
  }
}
