import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:enerren/component/ModalComponent.dart';
import 'package:enerren/component/angkutDecorationComponent.dart';
import 'package:enerren/component/spinnerComponent.dart';
import 'package:enerren/model/InsurancePremiModel.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewModel.dart';
import 'presenter.dart';
import 'package:component_icons/font_awesome.dart';
import 'package:flutter_svg/flutter_svg.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
      create: (context) => super.data,
      child: Consumer<ViewModel>(
        builder: (ctx, dt, child) {
          return Scaffold(
            backgroundColor: System.data.colorUtil.scaffoldBackgroundColor,
            appBar: appBar(),
            body: Stack(
              children: <Widget>[
                body(dt),
                DecorationComponent.circularLOadingIndicator(
                  controller: data.loadingController,
                ),
              ],
            ),
            bottomNavigationBar: bottomNavigationBar(),
          );
        },
      ),
    );
  }

  Widget appBar() {
    return BottonComponent.customAppBar1(
      context: context,
      actionText: "",
      title: System.data.resource.service,
      titleColor: System.data.colorUtil.lightTextColor,
      backButtonColor: System.data.colorUtil.lightTextColor,
      backgroundColor: System.data.colorUtil.primaryColor,
    );
  }

  Widget body(dt) {
    return SingleChildScrollView(
      controller: data.bodyController,
      reverse: true,
      child: Column(
        children: <Widget>[
          DecorationComponent.wizardBar(
            routeColor: System.data.colorUtil.primaryColor,
            serviceColor: System.data.colorUtil.primaryColor,
          ),
          deliveryScheduleList(dt),
          detailList(dt),
          // extraDetailList(dt)
        ],
      ),
    );
  }

  Widget deliveryScheduleList(dt) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(15),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${System.data.resource.deliverySchedule}",
            style: System.data.textStyleUtil.linkLabel(),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: dt.type,
                  onChanged: (value) {
                    dt.type = value;
                    dt.commit();
                  },
                  activeColor: System.data.colorUtil.primaryColor,
                ),
                Text(
                  "${System.data.resource.instantCourier}",
                  style: System.data.textStyleUtil.mainLabel(),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: dt.type,
                        onChanged: (value) {
                          dt.type = value;
                          dt.commit();
                        },
                      ),
                      Text(
                        "${System.data.resource.scheduled}",
                        style: System.data.textStyleUtil.mainLabel(),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 210,
                  height: 40,
                  child: InputComponent.inputTextWithCorner(
                      backgroundColor:
                          System.data.colorUtil.inputTextBackground,
                      autoFocus: false,
                      focusnode: dateFocus,
                      fontSize: 14,
                      borderWidth: 1,
                      textAlign: TextAlign.left,
                      borderInputGray:
                          dateController.stateInput == StateInput.Error
                              ? Colors.red
                              : System.data.colorUtil.blueColor,
                      inputBorderError: System.data.colorUtil.redColor,
                      contentPadding: EdgeInsets.only(bottom: 10, left: 10),
                      controller: dateController,
                      stateInput: dateState,
                      suffixIcon: IconButton(
                        icon: Icon(FontAwesomeLight(FontAwesomeId.fa_calendar),
                            color: System.data.colorUtil.blueColor),
                        onPressed: () => selectDate(context),
                      ),
                      textInputAction: TextInputAction.done,
                      corner: 5,
                      readOnly: false,
                      onChanged: (val) {
                        dateController.text =
                            "${data.scheduleDate.day}/${data.scheduleDate.month}/${data.scheduleDate.year}";
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget detailList(dt) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 6),
          ),
        ],
      ),
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, bottom: 30),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${System.data.resource.extraService}",
            style: System.data.textStyleUtil.linkLabel(),
          ),
          extraPeople(),
          itemType(),
          insurance(),
        ],
      ),
    );
  }

  Widget extraPeople() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "${System.data.resource.extraPeople}",
            style: System.data.textStyleUtil.mainLabel(),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: SpinnerInput(
                  spinnerValue: data.extraHelperCount.toDouble(),
                  minusButton: SpinnerButtonStyle(
                      color: System.data.colorUtil.primaryColor),
                  plusButton: SpinnerButtonStyle(
                      color: System.data.colorUtil.primaryColor),
                  onChange: (val) {
                    data.extraHelperCount = val.toInt();
                    data.commit();
                  },
                )),
          )
          // Switch(
          //   focusColor: System.data.colorUtil.secondaryColor,
          //   value: dt.extraPeople,
          //   onChanged: (value) {
          //     dt.extraPeople = value;
          //     dt.commit();
          //   },
          //   activeTrackColor: System.data.colorUtil.blueColor,
          //   activeColor: System.data.colorUtil.secondaryColor,
          // ),
        ],
      ),
    );
  }

  Widget itemType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            "${System.data.resource.itemType}",
            style: System.data.textStyleUtil.linkLabel(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          height: 50,
          child: InputComponent.inputTextWithUnderLine(
              hintText: "${System.data.resource.exampleText}",
              controller: itemTypeController,
              enableUnderLineColor:
                  itemTypeController.stateInput == StateInput.Error
                      ? Colors.red
                      : System.data.colorUtil.blueColor,
              underLineColor: itemTypeController.stateInput == StateInput.Error
                  ? Colors.red
                  : System.data.colorUtil.blueColor,
              disableUnderlineColor:
                  itemTypeController.stateInput == StateInput.Error
                      ? Colors.red
                      : System.data.colorUtil.blueColor,
              focusedUnderLineColor:
                  itemTypeController.stateInput == StateInput.Error
                      ? Colors.red
                      : System.data.colorUtil.blueColor,
              onChange: (val) {
                data.itemDescription = val;
              }),
        ),
      ],
    );
  }

  Widget insurance() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "${System.data.resource.insurance}",
                  style: System.data.textStyleUtil.linkLabel(),
                ),
              ),
            ),
            Switch(
              value: data.useInsurance,
              onChanged: (value) {
                data.useInsurance = value;
                data.commit();
                data.bodyController.animateTo(0.0,
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 500));
              },
            )
          ],
        ),
        AnimatedContainer(
          height: data.useInsurance ? 180 : 0,
          curve: Curves.easeIn,
          duration: Duration(
            milliseconds: 500,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              insuranPremi(),
              SizedBox(
                height: 10,
              ),
              Text(
                "${System.data.resource.estimateGoodsPrice}",
                style: System.data.textStyleUtil.linkLabel(),
              ),
              SizedBox(
                height: 10,
              ),
              inputEstimationPrice(),
            ],
          ),
        )
      ],
    );
  }

  Widget insuranPremi() {
    return InputComponent.dropDownWithCorner<InsurancePremiModel>(
        borderColor: System.data.colorUtil.primaryColor,
        corner: 5,
        hint: System.data.resource.insuranceFee,
        items: getDropDownInsuranceItem(),
        value: data.selectedInsurance,
        onChangeds: (value) {
          data.selectedInsurance = value;
          data.commit();
        });
  }

  Widget inputEstimationPrice() {
    return InputComponent.inputTextWithCorner(
      controller: priceEstimationController,
      borderInputGray: priceEstimationController.stateInput == StateInput.Error
          ? Colors.red
          : System.data.colorUtil.blueColor,
      borderWidth: 1,
      corner: 5,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        data.estimateGoodsPrice =
            double.parse(priceEstimationController.content);
      },
    );
  }

  Widget extraDetailList(dt) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          pickUpLocation(dt),
          destination(dt),
        ],
      ),
    );
  }

  Widget pickUpLocation(dt) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "${System.data.resource.additionalDetail}",
              style: System.data.textStyleUtil.mainTitle(
                color: System.data.colorUtil.blueColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              "${System.data.resource.pickUpLocation}",
              style: System.data.textStyleUtil.mainTitle(
                color: System.data.colorUtil.blueColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                Container(
                  child: SvgPicture.asset("assets/angkut/man.svg"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 200,
                  height: 30,
                  child: InputComponent.inputTextWithCorner(
                      hintText: "${System.data.resource.name}",
                      fontSize: 14,
                      contentPadding:
                          EdgeInsets.only(top: 3, bottom: 3, left: 6),
                      controller: nameController,
                      corner: 5,
                      borderInputGray: System.data.colorUtil.blueColor),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Container(
                  child: SvgPicture.asset("assets/angkut/phone.svg"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 200,
                  height: 30,
                  child: InputComponent.inputTextWithCorner(
                      hintText: "${System.data.resource.phoneNumber}",
                      fontSize: 14,
                      contentPadding:
                          EdgeInsets.only(top: 3, bottom: 3, left: 6),
                      controller: nameController,
                      corner: 5,
                      borderInputGray: System.data.colorUtil.blueColor),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: SvgPicture.asset("assets/angkut/plus.svg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "${System.data.resource.fromContact}",
                          style: System.data.textStyleUtil.mainLabel(
                            color: System.data.colorUtil.blueColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "${System.data.resource.responsibleForPayment}",
                            style: System.data.textStyleUtil.mainLabel(
                              color: System.data.colorUtil.blueColor,
                            ),
                          ),
                        ),
                        Container(
                          child: Radio(
                            value: 0,
                            groupValue: dt.typee,
                            onChanged: (value) {
                              dt.typee = value;
                              dt.commit();
                            },
                            activeColor: System.data.colorUtil.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget destination(dt) {
    return Container(
      margin: EdgeInsets.only(left: 15, bottom: 15, right: 15, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              "${System.data.resource.destination}",
              style: System.data.textStyleUtil.mainTitle(
                color: System.data.colorUtil.blueColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                Container(
                  child: SvgPicture.asset("assets/angkut/man.svg"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 200,
                  height: 30,
                  child: InputComponent.inputTextWithCorner(
                      hintText: "${System.data.resource.name}",
                      fontSize: 14,
                      contentPadding:
                          EdgeInsets.only(top: 3, bottom: 3, left: 6),
                      controller: nameController,
                      corner: 5,
                      borderInputGray: System.data.colorUtil.blueColor),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Container(
                  child: SvgPicture.asset("assets/angkut/phone.svg"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 200,
                  height: 30,
                  child: InputComponent.inputTextWithCorner(
                      hintText: "${System.data.resource.phoneNumber}",
                      fontSize: 14,
                      contentPadding:
                          EdgeInsets.only(top: 3, bottom: 3, left: 6),
                      controller: nameController,
                      corner: 5,
                      borderInputGray: System.data.colorUtil.blueColor),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: SvgPicture.asset("assets/angkut/plus.svg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "${System.data.resource.fromContact}",
                          style: System.data.textStyleUtil.mainLabel(
                            color: System.data.colorUtil.blueColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "${System.data.resource.responsibleForPayment}",
                            style: System.data.textStyleUtil.mainLabel(
                              color: System.data.colorUtil.blueColor,
                            ),
                          ),
                        ),
                        Container(
                          child: Radio(
                            value: 1,
                            groupValue: dt.typee,
                            onChanged: (value) {
                              dt.typee = value;
                              dt.commit();
                            },
                            activeColor: System.data.colorUtil.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
      child: BottonComponent.roundedButton(
        colorBackground: System.data.colorUtil.primaryColor,
        onPressed: () {
          if (validate()) {
            if (data.extraHelperCount > 0) {
              if (data.loadingController.onLoading == false) {
                submit();
              }
            } else {
              popupConfirmNotUseHelper();
            }
          }
        },
        child: Text(
          "${System.data.resource.continuee}",
          style: System.data.textStyleUtil.mainTitle(),
        ),
      ),
    );
  }

  popupConfirmNotUseHelper() {
    return ModalComponent.bottomModalWithCorner(
      context,
      height: 316,
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: SvgPicture.asset(
                      "assets/angkut/angkut_helper.svg",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          System.data.resource.areYouSureYouWontUseSomeonesHelp,
                          textAlign: TextAlign.center,
                          style: System.data.textStyleUtil.mainLabel(),
                        ),
                        Text(
                          System.data.resource
                              .makeSureYouAndTheRecipientDontNeedHelpFromPeople,
                          textAlign: TextAlign.center,
                          style: System.data.textStyleUtil.mainLabel(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                color: System.data.colorUtil.primaryColor,
              )),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        if (data.loadingController.onLoading == false) {
                          submit();
                        }
                      },
                      child: Container(
                        color: System.data.colorUtil.primaryColor,
                        child: Center(
                          child: Text(
                            System.data.resource.yes,
                            style: System.data.textStyleUtil.mainTitle(
                              color: System.data.colorUtil.lightTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            System.data.resource.no,
                            style: System.data.textStyleUtil.mainTitle(
                              color: System.data.colorUtil.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
