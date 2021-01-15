import 'package:enerren/app/sapatetangga/module/map/presenter.dart';
import 'package:enerren/app/sapatetangga/module/map/viewModel.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/bottomDockComponent.dart';
// import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/component/customeGoogleMap/googleMaps.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
      create: (context) => super.model,
      child: Consumer<ViewModel>(builder: (ctx, data, child) {
        return Scaffold(
          appBar: appBar(),
          body: body(),
          bottomNavigationBar: bottomNavigationBar(),
        );
      }),
    );
  }

  Widget body() {
    return Container(
      child: Stack(
        children: listComponent(),
      ),
    );
  }

  List<Widget> listComponent() {
    return [
      map(),
      zoomButton(),
      addIcon(),
      // bottomSheet(),
    ];
  }

  PreferredSizeWidget appBar() {
    return BottonComponent.customAppBar1(
      context: context,
      backgroundColor: System.data.colorUtil.primaryColor,
      backButtonColor: System.data.colorUtil.secondaryColor,
      actionText: System.data.resource.back,
      title: System.data.resource.map,
      titleColor: System.data.colorUtil.secondaryColor,
    );
  }

  Widget map() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                GoogleMaps(
                  googleMapController: model.mapsControllers,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      layer(),
                      trafic(),
                    ],
                  ),
                ),
                // mapCircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget trafic() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        color: super.model.isTrafic
            ? System.data.colorUtil.primaryColor
            : System.data.colorUtil.greyColor,
        icon: Icon(Icons.traffic),
        onPressed: () {
          setTrafic(model.mapsControllers.trafficEnabled());
        },
      ),
    );
  }

  Widget layer() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        color: System.data.colorUtil.primaryColor,
        icon: Icon(Icons.layers),
        onPressed: () {
          model.mapsControllers.changeMapType();
        },
      ),
    );
  }

  // Widget mapCircularProgressIndicator() {
  //   return CircularProgressIndicatorComponent(
  //     aligment: Alignment.center,
  //     controller: mapLoadingController,
  //   );
  // }

  Widget bottomSheet() {
    return BottomDockComponent(
      controller: super.bottomSheetController,
      gripBackground: Colors.white,
      gripColorOnFree: Colors.grey,
      gripColorOnDrag: Colors.grey,
      handleBar: (value) => Container(
        margin: EdgeInsets.only(top: 2),
        height: 20,
        color: Colors.white.withOpacity(0),
        width: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
        ),
      ),
      minHeight: 10,
      maxHeight: super.bottomSheetHeight,
      isExpand: false,
      extraArea: 10,
      bottonSheetDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.lerp(Radius.circular(10), Radius.circular(40), 1),
          topRight: Radius.lerp(Radius.circular(10), Radius.circular(40), 1),
        ),
      ),
      contentPadding: super.bottomSheetContentPadding,
      child: information(),
    );
  }

  Widget zoomButton() {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue[900],
                ),
                color: Colors.white),
            margin: EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            child: Icon(
              Icons.add,
              color: Colors.blue[900],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue[900],
                ),
                color: Colors.white),
            margin: EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Icon(
              Icons.remove,
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }

  Widget addIcon() {
    return Container(
      child: Column(
        children: [
          Container(
             margin: EdgeInsets.only(
                    left: 374,
                    top: 40,
                  ),
            child: SvgPicture.asset("assets/sapatetangga/icon_add_home.svg"),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 374,
              top: 10,
            ),
            child: SvgPicture.asset("assets/sapatetangga/icon_add_neighbor.svg"),
          ),
           Container(
            margin: EdgeInsets.only(
              left: 374,
              top: 10,
            ),
            child: SvgPicture.asset("assets/sapatetangga/icon_add_geofence.svg"),
          ),
        ],
      ),
    );
  }

  Widget information() {
    return Center(
      child: Text("nandang hermawn"),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      width: 0,
      height: 0,
    );
  }
}
