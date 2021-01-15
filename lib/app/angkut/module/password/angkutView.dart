import 'package:enerren/component/angkutDecorationComponent.dart';
import 'package:enerren/module/password/presenter.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';

import 'package:enerren/module/password/view.dart';
import 'angkutPresenter.dart';

class AngkutView extends View with AngkutPresenter {
  ValueChanged<Map<String, dynamic>> onSuccess;

  AngkutView({
    this.onSuccess,
  });

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
    return DecorationComponent.circularLOadingIndicator(
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
