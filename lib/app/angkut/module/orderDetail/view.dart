import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/angkutDecorationComponent.dart';
import 'package:enerren/component/ratingComponent.dart';
import 'package:enerren/model/tmsDeliveryEmergencyModel.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'presenter.dart';
import 'package:component_icons/font_awesome.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ViewModel.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: Consumer<ViewModel>(
        builder: (ctx, data, child) {
          return Scaffold(
            backgroundColor: System.data.colorUtil.scaffoldBackgroundColor,
            appBar: appBar(),
            body: body(data),
          );
        },
      ),
    );
  }

  Widget body(ViewModel viewModel) {
    return Stack(
      children: <Widget>[
        home(),
        DecorationComponent.circularLOadingIndicator(
          lightMode: false,
          controller: loadingController,
        )
      ],
    );
  }

  PreferredSizeWidget appBar() {
    return BottonComponent.customAppBar1(
      title: System.data.resource.orderDetail,
      context: context,
      actionText: "",
      titleColor: System.data.colorUtil.secondaryColor,
      backButtonColor: System.data.colorUtil.lightTextColor,
      actionTextStyle: System.data.textStyleUtil.mainLabel(),
      actionTextColor: System.data.colorUtil.secondaryColor,
      titleStyle: System.data.textStyleUtil.mainTitle(),
      backgroundColor: System.data.colorUtil.primaryColor,
    );
  }

  Widget home() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            shipmentNumber(),
            customer(),
            currentDriver(),
            historyDriver(),
            shipment(),
            vehicles(),
            goods(),
            payment(),
            buttom(),
          ],
        ),
      ),
    );
  }

  Widget buttom() {
    return model.shipment.shipmentStatusId == 1 ||
            model.shipment.shipmentStatusId == 2
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

  Widget shipmentNumber() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.showShipmentNumber == true
                    ? Text(
                        "${model.shipment.shipmentNumber}",
                        style: System.data.textStyleUtil.mainLabel(
                            color: System.data.colorUtil.disableColor,
                            fontFamily: System.data.fontUtil.primary),
                      )
                    : Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                          color: System.data.colorUtil.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          System.data.resource.newOrder,
                          style: System.data.textStyleUtil.mainLabel(
                            color: System.data.colorUtil.lightTextColor,
                          ),
                        ),
                      ),
                Text(
                  "${model.shipment.shipmentDate != null ? DateFormat('EEEE, yyyy-MM-dd').format(model.shipment.shipmentDate) : ""}",
                  style: System.data.textStyleUtil.mainLabel(
                      color: System.data.colorUtil.disableColor,
                      fontFamily: System.data.fontUtil.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customer() {
    return Container(
      padding: EdgeInsets.only(top: 9, bottom: 9, right: 12, left: 12),
      margin: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        color: System.data.colorUtil.secondaryColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: System.data.colorUtil.shadowColor.withOpacity(.20),
            offset: Offset(.0, 5),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage("${model.shipment.customerImageUrl}"),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${System.data.resource.customer}",
                  style: System.data.textStyleUtil.mainLabel(
                      color: System.data.colorUtil.primaryColor,
                      fontFamily: System.data.fontUtil.primary),
                ),
                Text("${model.shipment.customerName}"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget currentDriver() {
    if (model.shipment.shipmentStatusId > 2) {
      TmsDeliveryEmergencyModel emergencyData =
          model.shipment.tmsShipmentDestinationList.first.getCurrentEmergency;

      return driver(
        name: model.shipment.tmsShipmentDestinationList.first.driverName,
        photo: model.shipment.tmsShipmentDestinationList.first.driverImageUrl,
        rating: model.shipment.tmsShipmentDestinationList.first.driverRating,
        emergencyLampColor: model.shipment.shipmentStatusId == 13 &&
                emergencyData.driverId ==
                    model.shipment.tmsShipmentDestinationList.first.driverId
            ? System.data.colorUtil.orangeColor
            : Colors.transparent,
        emergencyModel: model.shipment.shipmentStatusId == 13 &&
                emergencyData.driverId ==
                    model.shipment.tmsShipmentDestinationList.first.driverId
            ? emergencyData
            : null,
      );
    }
    return Container(
      height: 0,
      width: 0,
    );
  }

  Widget historyDriver() {
    if (model.shipment.tmsShipmentDestinationList.first.emergencyData != null &&
        model.shipment.tmsShipmentDestinationList.first.emergencyData.length >
            0) {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, left: 13),
              child: Text(
                "${System.data.resource.diverHistory}",
                style: System.data.textStyleUtil.mainLabel(
                    color: System.data.colorUtil.primaryColor,
                    fontFamily: System.data.fontUtil.primary),
              ),
            ),
            Column(
              children: List.generate(
                  model.shipment.tmsShipmentDestinationList.first.emergencyData
                      .length, (i) {
                if (model.shipment.tmsShipmentDestinationList.first
                            .emergencyData[i].driverId !=
                        model.shipment.tmsShipmentDestinationList.first
                            .driverId ||
                    model.shipment.tmsShipmentDestinationList.first
                            .emergencyData[i].emergencyStatus !=
                        1) {
                  return driver(
                      name: model.shipment.tmsShipmentDestinationList.first
                          .emergencyData[i].driverName,
                      photo: model.shipment.tmsShipmentDestinationList.first
                          .emergencyData[i].driverImageUrl,
                      rating: model.shipment.tmsShipmentDestinationList.first
                          .emergencyData[i].driverRating,
                      emergencyLampColor: model
                                  .shipment
                                  .tmsShipmentDestinationList
                                  .first
                                  .emergencyData[i]
                                  .emergencyStatus ==
                              1
                          ? System.data.colorUtil.redColor
                          : System.data.colorUtil.primaryColor,
                      emergencyModel: model.shipment.tmsShipmentDestinationList
                          .first.emergencyData[i]);
                } else {
                  return Container(
                    height: 0,
                    width: 0,
                  );
                }
              }),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 0,
        width: 0,
      );
    }
  }

  Widget driver({
    @required String photo,
    @required String name,
    @required Color emergencyLampColor,
    @required double rating,
    @required TmsDeliveryEmergencyModel emergencyModel,
  }) {
    return GestureDetector(
      onTap: () => widget.onTapDriver(model.shipment, emergencyModel),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 9, right: 12, left: 12),
        margin: EdgeInsets.only(bottom: 0, top: 10),
        decoration: BoxDecoration(
          color: System.data.colorUtil.secondaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: System.data.colorUtil.shadowColor.withOpacity(.20),
              offset: Offset(.0, 5),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage("$photo"),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${System.data.resource.driver}",
                    style: System.data.textStyleUtil.mainLabel(
                        color: System.data.colorUtil.primaryColor,
                        fontFamily: System.data.fontUtil.primary),
                  ),
                  Text("$name"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RatingComponent(
                        controller: RatingController(),
                        height: 15,
                        readOnly: true,
                        score: model.shipment.tmsShipmentDestinationList.first
                            .driverRating,
                        width: 30,
                        space: 0,
                        alignment: MainAxisAlignment.end,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                        left: 10,
                        top: 0,
                      ),
                      height: 25,
                      width: 25,
                      child: Center(
                        child: SvgPicture.asset(
                            "assets/angkut/icon_emergency.svg",
                            color: emergencyLampColor),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget shipment() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(13),
            child: Text(
              "${System.data.resource.detailShipment}",
              style: System.data.textStyleUtil.mainLabel(
                  color: System.data.colorUtil.primaryColor,
                  fontFamily: System.data.fontUtil.primary),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 330,
            decoration: BoxDecoration(
              color: System.data.colorUtil.secondaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: System.data.colorUtil.shadowColor.withOpacity(.20),
                  offset: Offset(.0, 5),
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                DecorationComponent.detailShipment(
                  context: context,
                  poinName: "${System.data.resource.pickUpLocation}",
                  rightWidget: model.shipment.shipmentStatusId >= 0
                      ? GestureDetector(
                          onTap: onTapTrack,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "${System.data.resource.track}",
                                style: System.data.textStyleUtil.linkLabel(),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                FontAwesomeRegular(
                                    FontAwesomeId.fa_chevron_right),
                                size: 15,
                                color: System.data.colorUtil.primaryColor,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 0,
                          height: 0,
                        ),
                  name:
                      "${model.shipment.tmsShipmentDestinationList.first.originContactPerson}",
                  phone:
                      "${model.shipment.tmsShipmentDestinationList.first.originContactNumber}",
                  next: true,
                  icon: SvgPicture.asset("assets/angkut/box_angkut.svg"),
                  address:
                      "${model.shipment.tmsShipmentDestinationList.first.originAddress}",
                  guarent: model.shipment.payerName ==
                              model.shipment.tmsShipmentDestinationList.first
                                  .originContactPerson &&
                          model.shipment.payerPhoneNo ==
                              model.shipment.tmsShipmentDestinationList.first
                                  .originContactNumber
                      ? true
                      : false,
                ),
                DecorationComponent.detailShipment(
                  context: context,
                  poinName: "${System.data.resource.destination}",
                  name:
                      "${model.shipment.tmsShipmentDestinationList.first.destinationContactPerson}",
                  phone:
                      "${model.shipment.tmsShipmentDestinationList.first.destinationContactNumber}",
                  icon: Icon(
                    FontAwesomeSolid(FontAwesomeId.fa_map_marker_alt),
                    color: System.data.colorUtil.redColor,
                  ),
                  address:
                      "${model.shipment.tmsShipmentDestinationList.first.destinationAddress}",
                  guarent: model.shipment.payerName ==
                              model.shipment.tmsShipmentDestinationList.first
                                  .destinationContactPerson &&
                          model.shipment.payerPhoneNo ==
                              model.shipment.tmsShipmentDestinationList.first
                                  .destinationContactNumber
                      ? true
                      : false,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget vehicles() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(13),
            child: Text(
              "${System.data.resource.detailVehicle}",
              style: System.data.textStyleUtil.mainLabel(
                  color: System.data.colorUtil.primaryColor,
                  fontFamily: System.data.fontUtil.primary),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: System.data.colorUtil.secondaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: System.data.colorUtil.shadowColor.withOpacity(.20),
                  offset: Offset(.0, 5),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                detail(
                    title: System.data.resource.vehicleType,
                    value: "${model.shipment.vehicleTypeName}"),
                detail(
                    title: System.data.resource.shipmentOption,
                    value:
                        "${model.shipment.isInstant ? System.data.resource.instant : System.data.resource.scheduled}"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget goods() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(13),
            child: Text(
              "${System.data.resource.goodsDetail}",
              style: System.data.textStyleUtil.mainLabel(
                  color: System.data.colorUtil.primaryColor,
                  fontFamily: System.data.fontUtil.primary),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: System.data.colorUtil.secondaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: System.data.colorUtil.shadowColor.withOpacity(.20),
                  offset: Offset(.0, 5),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                detail(
                  title: System.data.resource.jenisBarang,
                  value: "${model.shipment.deliveryDescription}",
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: ontapPickupDetail,
                        child: Text(
                          "${System.data.resource.loadingDetail}",
                          style: System.data.textStyleUtil.linkLabel(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: onTapUnloadingDetail,
                        child: Text(
                          "${System.data.resource.unloadingDetail}",
                          style: System.data.textStyleUtil.linkLabel(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget payment() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(13),
            child: Text(
              "${System.data.resource.paymentDetail}",
              style: System.data.textStyleUtil.mainLabel(
                  color: System.data.colorUtil.primaryColor,
                  fontFamily: System.data.fontUtil.primary),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: System.data.colorUtil.secondaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: System.data.colorUtil.shadowColor.withOpacity(.20),
                  offset: Offset(.0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                tarifDasar(),
                detail(
                    title: System.data.resource.additionalService, value: ""),
                model.shipment.extraHelperCount != null
                    ? detail(
                        title: System.data.resource.helperPeople,
                        title1: "x${model.shipment.extraHelperCount}",
                        value:
                            "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.extraHelperAmount)}",
                        sub: true)
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                detail(
                  titleWidget: Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              "${System.data.resource.insuranceFee}",
                              style: System.data.textStyleUtil.mainLabel(
                                color: System.data.colorUtil.primaryColor,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                model.showDetailInsurance =
                                    !model.showDetailInsurance;
                                model.commit();
                              },
                              child: Icon(
                                !model.showDetailInsurance
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: System.data.colorUtil.primaryColor,
                              ),
                            )
                          ],
                        )),
                  ),
                  value:
                      "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.insuranceAmount)}",
                  sub: true,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: model.showDetailInsurance ? 100 : 0,
                  curve: Curves.easeIn,
                  margin: EdgeInsets.only(
                    left: 50,
                  ),
                  child: Column(
                    children: [
                      subDetail(
                        title: System.data.resource.provider,
                        value: model.shipment.insuranceName ?? "-",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      subDetail(
                        title: System.data.resource.coverageInsurance,
                        value: model.shipment.premiName ?? "-",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      subDetail(
                        title: System.data.resource.estimateGoodsPrice,
                        value:
                            "Rp. ${model.shipment.estimateGoodsPrice == null ? "-" : NumberFormat("#,###", System.data.resource.locale).format(model.shipment.estimateGoodsPrice ?? 0)}",
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Divider(
                    height: 6,
                    color: System.data.colorUtil.darkTextColor,
                    thickness: 1,
                  ),
                ),
                subTotal(),
                chargeFee(),
                discount(),
                Container(
                  width: 200,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Divider(
                    height: 6,
                    color: System.data.colorUtil.darkTextColor,
                    thickness: 1,
                  ),
                ),
                detail(
                    title: System.data.resource.totalPay,
                    sTiltle: System.data.textStyleUtil.mainLabel(
                        fontWeight: FontWeight.bold,
                        color: System.data.colorUtil.primaryColor,
                        fontSize: System.data.fontUtil.xxl),
                    value:
                        "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.totalPrice)}",
                    sValue: System.data.textStyleUtil.mainLabel(
                        color: System.data.colorUtil.redColor,
                        fontSize: System.data.fontUtil.xxl)),
                Container(
                  margin: EdgeInsets.only(bottom: 13, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "${model.shipment.shipmentInvoice?.methodDetailName}",
                        style: System.data.textStyleUtil.mainLabel(
                            color: System.data.colorUtil.primaryColor,
                            fontFamily: System.data.fontUtil.primary),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: System.data.colorUtil.disableColor),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: SvgPicture.network(
                                  "${model.shipment.shipmentInvoice?.bankIconUrl}"))),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tarifDasar() {
    return detail(
        title:
            "${System.data.resource.rate} ( ${System.data.resource.distance} ${model.shipment.distancePickupToDestination?.ceil() ?? "-"} Km )",
        value:
            "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.basicPrice)}");
  }

  Widget subTotal() {
    return detail(
        title: System.data.resource.subtotal,
        value: model.shipment.subtotal == null
            ? "-"
            : "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.subtotal)}",
        sValue: System.data.textStyleUtil.mainLabel(
            color: System.data.colorUtil.darkTextColor,
            fontSize: System.data.fontUtil.xxl));
  }

  Widget chargeFee() {
    return detail(
        title: System.data.resource.serviceCharge,
        value: model.shipment.feeService == null
            ? "-"
            : "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.feeService)}",
        sub: true);
  }

  Widget discount() {
    return detail(
        title: "${System.data.resource.discount}",
        value:
            "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.discountAmount)}");
  }

  Widget detail({
    String title,
    Widget titleWidget,
    String title1,
    TextStyle sTiltle,
    TextStyle sValue,
    String value,
    bool sub = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 13, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          titleWidget == null
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: sub ? 10 : 0),
                    child: Text(
                      "$title",
                      style: sTiltle ??
                          System.data.textStyleUtil.mainLabel(
                            color: System.data.colorUtil.primaryColor,
                          ),
                    ),
                  ),
                )
              : titleWidget,
          title1 == null
              ? Container()
              : Container(
                  width: 40,
                  child: Text("$title1",
                      style: sTiltle ??
                          System.data.textStyleUtil.mainLabel(
                            color: System.data.colorUtil.primaryColor,
                          ))),
          Container(
            width: 150,
            alignment: Alignment.centerRight,
            child: Text(
              "$value",
              style: sValue ?? System.data.textStyleUtil.mainLabel(),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }

  Widget circularContainer(int i) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: System.data.colorUtil.yellowColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "$i",
          style: System.data.textStyleUtil.mainLabel(
              color: System.data.colorUtil.secondaryColor,
              fontSize: System.data.fontUtil.s,
              fontFamily: System.data.fontUtil.primary),
        ),
      ),
    );
  }

  Widget subDetail({
    String title,
    TextStyle styleTitle,
    String value,
    TextStyle styleValue,
  }) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Text(
              "$title",
              style: styleTitle ??
                  System.data.textStyleUtil.mainLabel(
                    color: System.data.colorUtil.primaryColor,
                  ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            child: Text(
              "$value",
              style: styleValue ??
                  System.data.textStyleUtil.mainLabel(
                    color: System.data.colorUtil.darkTextColor,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
