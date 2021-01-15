import 'dart:async';

import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/model/PendingDataModel.dart';
import 'package:enerren/util/ErrorHandlingUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/util/TypeUtil.dart';
import 'package:enerren/util/constantUtil.dart';
import 'package:flutter/material.dart';
import 'view.dart';
import 'viewModel.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final ValueChanged2Param<PendingDataModel,
      CircularProgressIndicatorController> onSnedItem;

  const Presenter({
    Key key,
    this.view,
    this.onSnedItem,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    if (view != null) {
      return view;
    } else {
      return View();
    }
  }
}

abstract class PresenterState extends State<Presenter> {
  ViewModel model = new ViewModel();

  @override
  void initState() {
    super.initState();
  }

  void sendItem(
    PendingDataModel pendingDataModel,
    CircularProgressIndicatorController itemController,
  ) {
    if (widget.onSnedItem != null) {
      widget.onSnedItem(pendingDataModel, itemController);
    } else {
      itemController.startLoading();
      model.commit();
      Timer.periodic(Duration(seconds: 5), (timer) {
        itemController.stopLoading();
        model.commit();
      });
    }
  }

  void sendAllItem() {
    model.pendingDataModelController.value.data.forEach((element) {
      sendItem(element, model.loadingController[element.id]);
    });
  }

  void removeItem(
    PendingDataModel pendingDataModel,
    CircularProgressIndicatorController itemController,
  ) {
    itemController.startLoading();
    model.commit();
    pendingDataModel.remove(System.data.database).then((value) {
      itemController.stopLoading();
      model.pendingDataModelController.value.data
          .removeWhere((element) => element == pendingDataModel);
      model.commit();
    }).catchError((onError) {
      pendingDataModel.status = PendingDataStatus.failed;
      model.messageStatus[pendingDataModel.id] =
          ErrorHandlingUtil.handleApiError(onError);
      itemController.stopLoading();
      model.commit();
    });
  }
}
