import 'package:enerren/app/angkut/aCustomer/module/detailLocation/viewModel.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:enerren/component/angkutDecorationComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presenter.dart';
import 'package:component_icons/font_awesome.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
        create: (context) => super.model,
        child: Consumer<ViewModel>(
          builder: (ctx, dt, child) {
            return Scaffold(
              appBar: appbar(),
              body: Stack(
                children: <Widget>[
                  body(dt),
                  circularProgressIndicatorDecoration(),
                ],
              ),
              bottomNavigationBar: SafeArea(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 20,
                  ),
                  height: 60,
                  child: BottonComponent.roundedButton(
                    onPressed: submit,
                    text: "${System.data.resource.save}",
                    textstyle: System.data.textStyleUtil.mainTitle(),
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget appbar() {
    return BottonComponent.customAppBar1(
      context: context,
      actionText: "",
      title: "${System.data.resource.detailLocation}",
      backgroundColor: System.data.colorUtil.primaryColor,
      actionTextColor: System.data.colorUtil.lightTextColor,
      titleColor: System.data.colorUtil.lightTextColor,
      titleStyle: System.data.textStyleUtil.mainTitle(),
      backButtonColor: System.data.colorUtil.lightTextColor,
    );
  }

  Widget body(ViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3,
            offset: Offset(
              3,
              5,
            ),
          )
        ],
      ),
      child: ListView(
        children: <Widget>[
          inputLocation(),
          inputDetailAddress(),
          inputName(),
          inputPhoneNumber(),
          selectPhoneNumber(),
        ],
      ),
    );
  }

  Widget circularProgressIndicatorDecoration() {
    return DecorationComponent.circularLOadingIndicator(
        controller: loadingController);
  }

  Widget inputLocation() {
    addressController.text = model.address;
    return GestureDetector(
      onTap: selectLocation,
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 15, right: 20),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 100,
              padding: EdgeInsets.only(top: 5),
              child: Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  FontAwesomeLight(FontAwesomeId.fa_search),
                  color: System.data.colorUtil.primaryColor,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                child: Stack(
                  children: <Widget>[
                    InputComponent.inputTextWithCorner(
                        controller: addressController,
                        backgroundColor: Colors.white,
                        borderInputGray: System.data.colorUtil.primaryColor,
                        hintText: System.data.resource.address,
                        corner: 5,
                        maxLines: 5,
                        borderWidth: 1,
                        contentPadding: EdgeInsets.only(
                          top: 20,
                          bottom: 5,
                          right: 15,
                          left: 15,
                        ),
                        onChanged: (address) {
                          model.address = address;
                        }),
                    Container(color: Colors.white.withOpacity(0.1)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget inputDetailAddress() {
    detailAddressController.text = model.detailAdress;
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15, right: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 100,
            padding: EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                FontAwesomeLight(FontAwesomeId.fa_info_circle),
                color: System.data.colorUtil.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              child: InputComponent.inputTextWithCorner(
                  controller: detailAddressController,
                  backgroundColor: Colors.white,
                  borderInputGray: System.data.colorUtil.primaryColor,
                  hintText: System.data.resource.addDetailBuildingNameFloorEtc,
                  corner: 5,
                  maxLines: 5,
                  borderWidth: 1,
                  contentPadding: EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                    right: 15,
                    left: 15,
                  ),
                  onChanged: (detailAddress) {
                    model.detailAdress = detailAddress;
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget inputName() {
    nameController.text = model.name;
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15, right: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            child: Icon(
              FontAwesomeLight(FontAwesomeId.fa_user_alt),
              color: System.data.colorUtil.primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: InputComponent.inputTextWithCorner(
                  controller: nameController,
                  backgroundColor: Colors.white,
                  borderInputGray: System.data.colorUtil.primaryColor,
                  hintText: widget.contactNameLabel ?? System.data.resource.senderName,
                  corner: 5,
                  borderWidth: 1,
                  contentPadding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    right: 15,
                    left: 15,
                  ),
                  onChanged: (name) {
                    model.name = name;
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget inputPhoneNumber() {
    phoneNumberController.text = model.phoneNumber;
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15, right: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            child: Icon(
              FontAwesomeLight(FontAwesomeId.fa_phone_alt),
              color: System.data.colorUtil.primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: InputComponent.inputTextWithCorner(
                  controller: phoneNumberController,
                  backgroundColor: Colors.white,
                  borderInputGray: System.data.colorUtil.primaryColor,
                  hintText: widget.phoneNumberLabel ?? System.data.resource.phoneNumber,
                  corner: 5,
                  borderWidth: 1,
                  contentPadding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    right: 15,
                    left: 15,
                  ),
                  keyboardType: TextInputType.phone,
                  position: "",
                  fontColor: System.data.colorUtil.darkTextColor,
                  onChanged: (phone) {
                    model.phoneNumber = phone;
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget selectPhoneNumber() {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 15, right: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            // child: Icon(
            //   FontAwesomeLight(FontAwesomeId.fa_phone_alt),
            //   color: System.data.colorUtil.primaryColor,
            // ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                pickContact();
              },
              child: Container(
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 30,
                        child: Icon(
                          FontAwesomeLight(FontAwesomeId.fa_address_book),
                          color: System.data.colorUtil.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "${System.data.resource.pickFromContact}",
                            style: System.data.textStyleUtil.linkLabel(),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
