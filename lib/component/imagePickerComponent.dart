import 'dart:convert';
import 'dart:io';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/util/TypeUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:enerren/util/StringExtention.dart';

class ImagePickerComponent extends StatelessWidget {
  final ImagePickerController controller;
  final bool camera;
  final bool galery;
  final WidgetFromDataBuilder2<WidgetBuilder, ImagePickerValue> container;
  final WidgetFromDataBuilder<ImagePickerValue> placeHolderContainer;
  final WidgetFromDataBuilder<ImagePickerValue> imageContainer;
  final WidgetFromDataBuilder<VoidCallback> buttonCamera;
  final WidgetFromDataBuilder<VoidCallback> buttonGalery;
  final WidgetFromDataBuilder2<VoidCallback, VoidCallback> popUpChild;
  final Alignment popUpAlign;
  final BoxDecoration popUpDecoration;
  final EdgeInsets popUpMargin;
  final EdgeInsets popUpPadding;
  final double popUpHeight;
  final double popUpWidth;
  final ValueChanged<ImagePickerController> onTap;
  final bool readOnly;
  final double containerHeight;
  final double containerWidth;
  final int imageQuality;

  const ImagePickerComponent({
    Key key,
    this.controller,
    this.camera = true,
    this.galery = true,
    this.container,
    this.placeHolderContainer,
    this.imageContainer,
    this.buttonCamera,
    this.buttonGalery,
    this.popUpChild,
    this.popUpAlign,
    this.popUpDecoration,
    this.popUpMargin,
    this.popUpPadding,
    this.popUpHeight,
    this.popUpWidth,
    this.onTap,
    this.readOnly = false,
    this.containerHeight,
    this.containerWidth,
    this.imageQuality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ImagePickerValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: readOnly == false
              ? onTap != null
                  ? () {
                      onTap(controller);
                    }
                  : () {
                      if (value.state != ImagePickerComponentState.Disable) {
                        if (camera == true && galery == true) {
                          openModal(context);
                        } else if (camera == true) {
                          controller.getImages(
                              camera: true, imageQuality: imageQuality);
                        } else if (galery == true) {
                          controller.getImages(
                              camera: false, imageQuality: imageQuality);
                        }
                      }
                    }
              : () {},
          child: container != null
              ? container((context) {
                  return widgetBuilder(value);
                }, value)
              : Container(
                  height: containerHeight ?? 100,
                  width: containerWidth ?? 100,
                  child: Center(
                    child: widgetBuilder(value),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: stateColor(value.state),
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
        );
      },
    );
  }

  void openModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      elevation: 1,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.red.withOpacity(0),
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop("modal");
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.0),
            child: Align(
              alignment: popUpAlign ?? Alignment.bottomCenter,
              child: Container(
                height: popUpHeight ?? 170,
                width: popUpWidth ?? double.infinity,
                margin: popUpMargin ?? popUpAlign == Alignment.center
                    ? EdgeInsets.only(left: 10, right: 20)
                    : null,
                padding: popUpPadding ?? EdgeInsets.all(20),
                decoration: popUpDecoration ??
                    BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: popUpAlign == Alignment.center
                            ? Radius.circular(20)
                            : Radius.zero,
                        bottomRight: popUpAlign == Alignment.center
                            ? Radius.circular(20)
                            : Radius.zero,
                      ),
                    ),
                child: popUpChild != null
                    ? popUpChild(() {
                        openCamera(context);
                      }, () {
                        openGalery(context);
                      })
                    : Column(
                        children: <Widget>[
                          Text(
                            "${System.data.resource.selectPhoto}",
                            style: System.data.textStyleUtil.linkLabel(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          buttonCamera != null
                              ? buttonGalery(() {
                                  openGalery(context);
                                })
                              : Container(
                                  height: 35,
                                  width: 200,
                                  child: BottonComponent.roundedButton(
                                    onPressed: () {
                                      openCamera(context);
                                    },
                                    colorBackground:
                                        System.data.colorUtil.primaryColor,
                                    text: System.data.resource.camera,
                                    textstyle:
                                        System.data.textStyleUtil.mainLabel(),
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          buttonGalery != null
                              ? buttonGalery(() {
                                  openGalery(context);
                                })
                              : Container(
                                  height: 35,
                                  width: 200,
                                  child: BottonComponent.roundedButton(
                                    onPressed: () {
                                      openGalery(context);
                                    },
                                    colorBackground:
                                        System.data.colorUtil.primaryColor,
                                    text: System.data.resource.galery,
                                    textstyle:
                                        System.data.textStyleUtil.mainLabel(),
                                  ),
                                ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  void openGalery(BuildContext context) {
    Navigator.of(context).pop();
    controller.getImages(camera: false, imageQuality: imageQuality);
  }

  void openCamera(BuildContext context) {
    Navigator.of(context).pop();
    controller.getImages(camera: true, imageQuality: imageQuality);
  }

  static Color stateColor(ImagePickerComponentState state) {
    return state == ImagePickerComponentState.Disable
        ? System.data.colorUtil.disableColor
        : state == ImagePickerComponentState.Error
            ? System.data.colorUtil.errorColor
            : System.data.colorUtil.primaryColor;
  }

  Widget widgetBuilder(ImagePickerValue value) {
    return value.loadData
        ? immageWidget(value)
        : placeHolderContainer != null
            ? placeHolderContainer(value)
            : placeHolder();
  }

  Widget immageWidget(ImagePickerValue value) {
    return imageContainer != null
        ? imageContainer(value)
        : Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: MemoryImage(value.valueUri.contentAsBytes()),
            )),
          );
  }

  Widget placeHolder() {
    return placeHolderContainer ??
        Icon(
          Icons.camera_alt,
          color: Colors.grey,
          size: 50,
        );
  }
}

class ImagePickerController extends ValueNotifier<ImagePickerValue> {
  ImagePickerController({ImagePickerValue value})
      : super(value == null ? ImagePickerValue() : value);

  String getExtension(String string) {
    List<String> getList = string.split(".");
    String data = getList.last.replaceAll("'", "");
    String result;
    if (data == "png") {
      result = "data:image/png;base64,";
    } else if (data == "jpeg") {
      result = "data:image/jpeg;base64,";
    } else if (data == "jpg") {
      result = "data:image/jpg;base64,";
    } else if (data == "gif") {
      result = "data:image/gif;base64,";
    }
    return result;
  }

  /// The `imageQuality` argument modifies the quality of the image, ranging from 0-100
  /// where 100 is the original/max quality. If `imageQuality` is null, the image with
  /// the original quality will be returned. Compression is only supportted for certain
  /// image types such as JPEG. If compression is not supported for the image that is picked,
  /// an warning message will be logged.
  void getImages({bool camera = true, int imageQuality = 30}) async {
    try {
      PickedFile picker;
      if (camera) {
        picker = await ImagePicker()
            .getImage(source: ImageSource.camera, imageQuality: imageQuality);
      } else {
        picker = await ImagePicker()
            .getImage(source: ImageSource.gallery, imageQuality: imageQuality);
      }

      File image = File(picker.path);

      String _valueBase64Compress = "";
      value.fileImage = image;
      value.base64 = getExtension(image.toString()) +
          base64.encode(image.readAsBytesSync());
      notifyListeners();

      FlutterImageCompress.compressWithFile(
        image.absolute.path,
        quality: value.quality,
      ).then((a) {
        _valueBase64Compress =
            getExtension(image.toString()) + base64.encode(a);
        value.base64Compress = _valueBase64Compress;
        value.loadData = true;
        value.valueUri = Uri.parse(_valueBase64Compress).data;
        getBase64();
        notifyListeners();
      }).catchError((e) {
        value.error = e;
        notifyListeners();
      });
    } catch (e) {
      ModeUtil.debugPrint("error on get picture");
    }
  }

  String getBase64() {
    return value.base64;
  }

  String getBase64Compress() {
    return value.base64Compress;
  }

  File getFile() {
    return value.fileImage;
  }

  void clear() {
    value.fileImage = null;
    value.base64 = null;
    value.base64Compress = null;
    notifyListeners();
  }

  List<Object> getAll() {
    List<Object> list = [value.base64, value.base64Compress, value.fileImage];
    return list;
  }

  String getFileName() {
    List<String> getList = value.fileImage.toString().split("-");
    String data = getList.last.replaceAll("'", "");
    return data == "null" ? "" : data;
  }

  set state(ImagePickerComponentState state) {
    value.state = state;
    notifyListeners();
  }

  void disposes() {
    value.loadData = false;
    value.valueUri = null;
    value.base64Compress = null;
    value.base64 = null;
    value.fileImage = null;
    value.error = null;
    notifyListeners();
  }

  bool validate() {
    bool _isValid = getBase64().isNullOrEmpty() ? false : true;
    if (_isValid) {
      value.state = ImagePickerComponentState.Enable;
      commit();
    } else {
      value.state = ImagePickerComponentState.Error;
      commit();
    }
    return _isValid;
  }

  void setState(VoidCallback fn) {
    fn();
    notifyListeners();
  }

  void commit() {
    notifyListeners();
  }
}

class ImagePickerValue {
  bool loadData;
  String base64Compress;
  String base64;
  UriData valueUri;
  File fileImage;
  int quality;
  String error;
  ImagePickerComponentState state;

  ImagePickerValue({
    this.loadData = false,
    this.base64Compress,
    this.base64,
    this.quality = 25,
    this.valueUri,
    this.error,
    this.state = ImagePickerComponentState.Enable,
  });
}

enum ImagePickerComponentState {
  Enable,
  Disable,
  Error,
}
