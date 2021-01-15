import 'package:enerren/app/angkut/module/orderDetail/view.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'transporterPresenter.dart';

class TransporterView extends View with TransporterPresenter {
  @override
  Widget buttom() {
    return model.shipment.shipmentStatusId == 1 ||
            model.shipment.shipmentStatusId == 2 ||
            model.shipment.shipmentStatusId == 13
        ? Container(
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(13),
                    child: BottonComponent.roundedButton(
                        onPressed: onReceive,
                        text: "${System.data.resource.accept}"))
              ],
            ),
          )
        : Container(
            width: 0,
            height: 0,
          );
  }
}
