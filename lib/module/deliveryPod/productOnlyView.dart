import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/multipleImagePickerComponent.dart';
import 'package:enerren/module/deliveryPod/ViewModel.dart';
import 'package:enerren/module/deliveryPod/productOnlyPresenter.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOnlyView extends ProductOnlyPresenterState {
  @override
  Widget build(Object context) {
    return ChangeNotifierProvider<ViewModel>(
      create: (ctx) => super.model,
      child: Scaffold(
        appBar: appBar(),
        body: body(),
        backgroundColor: System.data.colorUtil.scaffoldBackgroundColor,
        bottomNavigationBar: buttonNavigationBar(),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Container(
        height: 420,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.shade300, blurRadius: 2, offset: Offset(2, 4))
        ]),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    "${System.data.resource.photoOfGoods}",
                    style: System.data.textStyleUtil.linkLabel(),
                  ),
                  Consumer<ViewModel>(
                    builder: (ctx, data, child) {
                      return Container(
                        height: 320,
                        margin: EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: model.isValidImagePicker
                                ? Colors.transparent
                                : System.data.colorUtil.redColor,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: MultipleImagePickerComponent(
                            controller: super.model.imagePickerControllers,
                            imageQuality: widget.imageQuality,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return BottonComponent.customAppBar1(
      context: context,
      actionText: "",
      title: "${widget.title ?? System.data.resource.pod}",
      titleStyle: System.data.textStyleUtil.mainTitle(
        color: System.data.colorUtil.lightTextColor,
      ),
      backButtonColor: System.data.colorUtil.lightTextColor,
      backgroundColor: System.data.colorUtil.primaryColor,
    );
  }

  Widget buttonNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: BottonComponent.mainBotton(
        text: "${System.data.resource.next}",
        backgroundColor: System.data.colorUtil.primaryColor,
        onTap: () {
          submit();
        },
      ),
    );
  }
}
