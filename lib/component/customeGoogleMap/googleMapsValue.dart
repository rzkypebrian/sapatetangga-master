import 'package:enerren/component/customeGoogleMap/objectData.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'googleMapsController.dart';

class GoogleMapValue {
  GoogleMapController controller;
  @required
  ObjectData selected;
  int selectedLayer;
  int selectedIndex;
  List<List<ObjectData>> point;
  // List<List<LatLng>> listPointPolyline;
  Map<PolylineId, Polyline> listPolyline;
  Map<PolygonId, Polygon> listPolygon;
  LatLng latLng;
  double zoom;
  @required
  Color primaryColor;
  @required
  Color secondColor;
  Polyline selectedPolyline;
  Polygon selectedPolygon;
  PolylineId polylineId;
  Map<MarkerId, Marker> listMarker;
  PolygonId polygonId;
  Marker selectedMarker;
  MarkerId markerId;
  int width;
  @required
  String primaryIcon;
  @required
  String secondaryIcon;
  bool mapIsReady;
  double tilt;
  double bearing;
  MapType mapType;
  ValueChanged<ObjectData> onTapMarker;
  ValueChanged<LatLng> centerMap;
  LatLng center;
  bool trafficEnabled;
  bool showMarker;
  bool rotateGesturesEnabled;
  bool startEndMarker;
  ValueChanged<GoogleMapsControllers> onMapReady;
  LatLngBounds bounds;
  Map<int, bool> showPolylineSetting = {};
  Map<int, List<PatternItem>> paternPolylineSetting = {};
  Map<int, bool> showPolygonSetting = {};
  Map<int, Color> fillColorPolygonSetting = {};

  GoogleMapValue({
    // this.listPointPolyline,
    this.selectedPolyline,
    this.startEndMarker = false,
    this.rotateGesturesEnabled = true,
    this.centerMap,
    this.trafficEnabled = false,
    this.showMarker = true,
    this.onTapMarker,
    this.mapType = MapType.normal,
    this.tilt = 0,
    this.bearing = 0,
    this.zoom = 13,
    this.mapIsReady = false,
    this.latLng,
    this.markerId,
    this.point,
    this.controller,
    this.selected,
    this.primaryColor,
    this.secondColor,
    this.width,
    this.polylineId,
    this.listMarker,
    this.listPolyline,
    this.listPolygon,
    this.selectedMarker,
    this.primaryIcon,
    this.secondaryIcon,
    this.onMapReady,
    this.bounds,
    this.showPolylineSetting,
    this.center,
  }) {
    this.listMarker = <MarkerId, Marker>{};
    this.listPolyline = <PolylineId, Polyline>{};
    this.listPolygon = <PolygonId, Polygon>{};
    this.latLng = LatLng(-6.175392, 106.827153);
    this.point = [];
    this.point.add(new List<ObjectData>()); //[0]
    this.point.add(new List<ObjectData>()); //[1]
    this.point.add(new List<ObjectData>()); //[2]
    this.point.add(new List<ObjectData>()); //[3]
    this.point.add(new List<ObjectData>()); //[4]
    this.point.add(new List<ObjectData>()); //[5]
    this.point.add(new List<ObjectData>()); //[6]
    this.point.add(new List<ObjectData>()); //[7]
    this.point.add(new List<ObjectData>()); //[8]
    this.point.add(new List<ObjectData>()); //[9]
    // this.listPointPolyline = [];
    // this.listPointPolyline.add(new List<LatLng>()); //[0]
    // this.listPointPolyline.add(new List<LatLng>()); //[1]
    // this.listPointPolyline.add(new List<LatLng>()); //[2]
    // this.listPointPolyline.add(new List<LatLng>()); //[3]
    // this.listPointPolyline.add(new List<LatLng>()); //[4]
    // this.listPointPolyline.add(new List<LatLng>()); //[5]
    // this.listPointPolyline.add(new List<LatLng>()); //[6]
    // this.listPointPolyline.add(new List<LatLng>()); //[7]
    // this.listPointPolyline.add(new List<LatLng>()); //[8]
    // this.listPointPolyline.add(new List<LatLng>()); //[9]
    this.point.first = [];
    this.showPolylineSetting = {};
    this.showPolygonSetting = {};
  }
}
