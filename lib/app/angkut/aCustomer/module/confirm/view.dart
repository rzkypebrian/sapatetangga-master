import 'package:component_icons/font_awesome.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/angkutDecorationComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'viewModel.dart';
import 'presenter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
      create: (context) => super.model,
      child: Consumer<ViewModel>(
        builder: (ctx, dt, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: System.data.colorUtil.scaffoldBackgroundColor,
              appBar: appBar(),
              body: Stack(
                children: [
                  body(dt, ctx),
                  circularProgressIndicatorDecoration()
                ],
              ),
              bottomNavigationBar: bottomNavBar(),
            ),
          );
        },
      ),
    );
  }

  Widget circularProgressIndicatorDecoration() {
    return DecorationComponent.circularLOadingIndicator(
      controller: model.loadingController,
    );
  }

  Widget appBar() {
    return BottonComponent.customAppBar1(
      context: context,
      actionText: "",
      title: "${System.data.resource.confirmation}",
      titleStyle: System.data.textStyleUtil.mainTitle(),
      backButtonColor: System.data.colorUtil.lightTextColor,
      backgroundColor: System.data.colorUtil.appBarColor,
    );
  }

  Widget body(ViewModel dt, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            wizardBar(),
            Container(
              padding: EdgeInsets.only(top: 20, left: 15, bottom: 15),
              child: Text(
                "${System.data.resource.deliveryDetail}",
                style: System.data.textStyleUtil.mainLabel(
                  color: System.data.colorUtil.blueColor,
                ),
              ),
            ),
            pickUpLocationList(dt, context),
            Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "${System.data.resource.vehicleDetail}",
                style: System.data.textStyleUtil.mainLabel(
                  color: System.data.colorUtil.blueColor,
                ),
              ),
            ),
            vehicleType(),
            Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "${System.data.resource.goodsDetail}",
                style: System.data.textStyleUtil.mainLabel(
                  color: System.data.colorUtil.blueColor,
                ),
              ),
            ),
            itemDetail(),
            Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "${System.data.resource.paymentDetail}",
                style: System.data.textStyleUtil.mainLabel(
                  color: System.data.colorUtil.blueColor,
                ),
              ),
            ),
            paymentDetail(),
            Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "${System.data.resource.personInChargeOfPayment}",
                style: System.data.textStyleUtil.mainLabel(
                  color: System.data.colorUtil.blueColor,
                ),
              ),
            ),
            personIncharges(),
          ],
        ),
      ),
    );
  }

  Widget personIncharges() {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    "${toBeginningOfSentenceCase(model.shipment.tmsShipmentDestinationList.first.originContactPerson)}"),
                Radio(
                    value: 0,
                    groupValue: model.currentIndex,
                    onChanged: (index) => model.personInCharge(index))
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: System.data.colorUtil.disableColor,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    "${toBeginningOfSentenceCase(model.shipment.tmsShipmentDestinationList.first.destinationContactPerson)}"),
                Radio(
                    value: 1,
                    groupValue: model.currentIndex,
                    onChanged: (index) => model.personInCharge(index))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pickUpLocationList(ViewModel dt, BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: System.data.colorUtil.secondaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: System.data.colorUtil.shadowColor.withOpacity(.20),
                  offset: Offset(.0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DecorationComponent.detailShipment(
                    context: context,
                    poinName: "${System.data.resource.pickUpLocation}",
                    rightWidget: dt.shipment.shipmentStatusId >= 3
                        ? GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "${System.data.resource.liveMap}",
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
                        "${dt.shipment.tmsShipmentDestinationList.first.originContactPerson}",
                    phone:
                        "${dt.shipment.tmsShipmentDestinationList.first.originContactNumber}",
                    next: true,
                    icon: SvgPicture.asset("assets/angkut/box_angkut.svg"),
                    address:
                        "${dt.shipment.tmsShipmentDestinationList.first.originAddress}",
                    guarent: dt.shipment.payerName ==
                                dt.shipment.tmsShipmentDestinationList.first
                                    .originContactPerson &&
                            dt.shipment.payerPhoneNo ==
                                dt.shipment.tmsShipmentDestinationList.first
                                    .originContactNumber
                        ? true
                        : false,
                  ),
                  DecorationComponent.detailShipment(
                    context: context,
                    poinName: "${System.data.resource.destination}",
                    name:
                        "${dt.shipment.tmsShipmentDestinationList.first.destinationContactPerson}",
                    phone:
                        "${dt.shipment.tmsShipmentDestinationList.first.destinationContactNumber}",
                    icon: Icon(
                      FontAwesomeSolid(FontAwesomeId.fa_map_marker_alt),
                      color: System.data.colorUtil.redColor,
                    ),
                    address:
                        "${dt.shipment.tmsShipmentDestinationList.first.destinationAddress}",
                    guarent: dt.shipment.payerName ==
                                dt.shipment.tmsShipmentDestinationList.first
                                    .destinationContactPerson &&
                            dt.shipment.payerPhoneNo ==
                                dt.shipment.tmsShipmentDestinationList.first
                                    .destinationContactNumber
                        ? true
                        : false,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget vehicleType() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 25, bottom: 20, top: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  "${System.data.resource.vehicleType}",
                  style: System.data.textStyleUtil.mainLabel(
                    color: System.data.colorUtil.blueColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "${model.shipment.vehicleTypeName}",
                  style: System.data.textStyleUtil.mainLabel(),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10, right: 20),
            child: Text(
              "${System.data.resource.warningVehicleType}",
              style: System.data.textStyleUtil.mainLabel(
                fontStyle: FontStyle.italic,
                color: System.data.colorUtil.redColor,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "${System.data.resource.deliverySchedule}",
                    style: System.data.textStyleUtil.mainLabel(
                      color: System.data.colorUtil.blueColor,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "${model.shipment.isInstant == true ? System.data.resource.instantCourier : System.data.resource.scheduled}",
                    style: System.data.textStyleUtil.mainLabel(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemDetail() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 25, bottom: 20, top: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  "${System.data.resource.itemType}",
                  style: System.data.textStyleUtil.mainLabel(
                    color: System.data.colorUtil.blueColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "${model.shipment.deliveryDescription}",
                  style: System.data.textStyleUtil.mainLabel(),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget paymentDetail() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 20, bottom: 0),
      padding: EdgeInsets.only(left: 25, bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    "${System.data.resource.rate} ( ${System.data.resource.distance} ${model.shipment.distancePickupToDestination?.ceil() ?? "-"} Km )",
                    style: System.data.textStyleUtil.mainLabel(
                      color: System.data.colorUtil.blueColor,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                      "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.basicPrice)}"),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "${System.data.resource.extraServices}",
              style: System.data.textStyleUtil
                  .mainLabel(color: System.data.colorUtil.blueColor),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    "${System.data.resource.extraPeople} ${model.shipment.extraHelperCount != null ? "(" + model.shipment.extraHelperCount.toString() + ")" : ""}",
                    style: System.data.textStyleUtil.mainLabel(
                      color: System.data.colorUtil.blueColor,
                    ),
                  ),
                ),
                model.shipment.extraHelper
                    ? Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                            "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.extraHelperAmount)}"),
                      )
                    : Container(
                        height: 0,
                        width: 0,
                      ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 0),
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
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                      "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.insuranceAmount)}"),
                )
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: model.showDetailInsurance ? 100 : 0,
            curve: Curves.easeIn,
            margin: EdgeInsets.only(
              left: 40,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
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
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    "${System.data.resource.discount}",
                    style: System.data.textStyleUtil.mainLabel(
                      color: System.data.colorUtil.blueColor,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                      "Rp. ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.discountAmount)}"),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 150,
              child: Divider(
                color: System.data.colorUtil.blackColor,
                height: 30,
                thickness: 1,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    "${System.data.resource.totalPayment}",
                    style: System.data.textStyleUtil.mainLabel(
                      color: System.data.colorUtil.blueColor,
                      fontSize: System.data.fontUtil.xxl,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "Rp.  ${NumberFormat("#,###.#", System.data.resource.locale).format(model.shipment.totalPrice)}",
                    style: System.data.textStyleUtil.mainLabel(
                        color: System.data.colorUtil.redColor,
                        fontSize: System.data.fontUtil.xxl,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: selectPaymentMethode,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      "${model.shipment.shipmentInvoice.methodDetailName}",
                      style: System.data.textStyleUtil.mainLabel(
                        color: System.data.colorUtil.blueColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                        "${model.shipment.shipmentInvoice.bankIconUrl}"),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: selectPaymentMethode,
              child: Container(
                padding: EdgeInsets.only(right: 20),
                height: 30,
                child: BottonComponent.roundedButton(
                    text: "${System.data.resource.changePaymentMethod}",
                    colorBackground: Colors.transparent,
                    textColor: System.data.colorUtil.blueColor,
                    border: Border.all(color: System.data.colorUtil.blueColor)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNavBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: BottonComponent.roundedButton(
        radius: 10,
        onPressed: () {
          if (model.loadingController.onLoading == false) {
            submit();
          }
        },
        child: Text(
          "${System.data.resource.continues}",
          style: System.data.textStyleUtil.mainLabel(
            color: System.data.colorUtil.lightTextColor,
            fontSize: System.data.fontUtil.xxl,
          ),
        ),
      ),
    );
  }

  Widget wizardBar() {
    return DecorationComponent.wizardBar(
      confirmationColor: System.data.colorUtil.primaryColor,
      routeColor: System.data.colorUtil.primaryColor,
      serviceColor: System.data.colorUtil.primaryColor,
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
