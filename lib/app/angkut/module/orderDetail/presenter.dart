import 'package:enerren/app/angkut/aDriver/localData.dart';
import 'package:enerren/app/angkut/model/AngkutShipmentModel.dart';
import 'package:enerren/component/angkutDecorationComponent.dart';
import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/model/VtsPositionModel.dart';
import 'package:enerren/model/tmsDeliveryEmergencyModel.dart';
import 'package:enerren/util/ErrorHandlingUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/util/TypeUtil.dart';
import 'package:flutter/material.dart';
import 'ViewModel.dart';
import 'view.dart';

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final ValueChanged<ViewModel> onTapReceive;
  final ValueChanged<AngkutShipmentModel> onTapLiveMap;
  final AngkutShipmentModel shipment;
  final ValueChanged2Param<AngkutShipmentModel, TmsDeliveryEmergencyModel>
      onTapDriver;
  final ValueChanged<AngkutShipmentModel> onTapLoadingDetail;
  final ValueChanged<AngkutShipmentModel> onTapUnloadingDetail;
  final bool showShipmentNumber;

  const Presenter({
    Key key,
    this.view,
    this.onTapReceive,
    this.shipment,
    this.onTapLiveMap,
    this.onTapDriver,
    this.onTapLoadingDetail,
    this.onTapUnloadingDetail,
    this.showShipmentNumber,
  }) : super(key: key);

  createState() {
    if (view != null) {
      return view;
    } else {
      return View();
    }
  }
}

abstract class PresenterState extends State<Presenter> {
  ViewModel model = new ViewModel();
  CircularProgressIndicatorController loadingController =
      new CircularProgressIndicatorController();
  int vehicleId;
  int vehicleIdVts;
  int driverId;

  @override
  void initState() {
    super.initState();
    loadingController.stopLoading();
    if (widget.shipment != null) {
      print("shipment from route ${widget.shipment.shipmentStatusId}");
      model.shipment = widget.shipment;
      model.commit();
    }
  }

  void onReceive() {
    ModeUtil.debugPrint("receive shipment");
    loadingController.startLoading();
    VtsPositionModel.getVehiclePosition(
            vehicleId: vehicleIdVts ??
                System.data.getLocal<LocalData>().user.vehicleIdVts)
        .then((onValue) {
      AngkutShipmentModel.acceptShipment(
        token: System.data.global.token,
        driverId: driverId ?? System.data.getLocal<LocalData>().user.driverId,
        shipmentId: model.shipment.tmsShipmentId,
        vehicleLat: onValue.lat,
        vehicleLon: onValue.lon,
        vehicleOdometer: onValue.odometer.toInt(),
        vahicleId:
            vehicleIdVts ?? System.data.getLocal<LocalData>().user.vehicleIdVts,
      ).then((onValue) {
        loadingController.stopLoading();
        model.shipment = onValue;
        ModeUtil.debugPrint(
            "vehicle id is ${onValue.tmsShipmentDestinationList.first.vehicleIdVts}");
        model.shipment = onValue;
        model.commit();
        onTapTrack();
      }).catchError((onError) {
        loadingController.stopLoading(
          messageAlign: Alignment.topCenter,
          messageWidget: DecorationComponent.topMessageDecoration(
            backgroundColor: System.data.colorUtil.redColor,
            message: ErrorHandlingUtil.handleApiError(onError,
                prefix: "Accept Order"),
          ),
        );
      });
    }).catchError((onError) {
      loadingController.stopLoading(
        messageAlign: Alignment.topCenter,
        messageWidget: DecorationComponent.topMessageDecoration(
            backgroundColor: System.data.colorUtil.redColor,
            message: ErrorHandlingUtil.handleApiError(
              onError,
              prefix: "get position",
            )),
      );
    });
  }

  void onTapTrack() {
    if (widget.onTapLiveMap != null) {
      widget.onTapLiveMap(model.shipment);
    }
  }

  void ontapPickupDetail() {
    if (widget.onTapLoadingDetail != null) {
      widget.onTapLoadingDetail(widget.shipment);
    } else {
      print("on tap shipment loading detail tapped");
    }
  }

  void onTapUnloadingDetail() {
    if (widget.onTapUnloadingDetail != null) {
      widget.onTapUnloadingDetail(widget.shipment);
    } else {
      print("on tap shipment unloading detail tapped");
    }
  }
}
