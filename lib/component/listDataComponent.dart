import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/main.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/util/TypeUtil.dart';
import 'package:flutter/material.dart';

class ListDataComponent<T> extends StatelessWidget {
  final ListDataComponentController<T> controller;
  final WidgetFromDataBuilder2<T, int> itemBuilder;
  final ScrollController scrollController = new ScrollController();
  final ValueChanged2Param<T, ScrollController> getNewData;
  final ValueChanged2Param<T, ScrollController> getOldData;
  final WidgetFromDataBuilder<CircularProgressIndicatorController>
      loadingWidgetBuilder;
  final WidgetFromDataBuilder<ScrollController> scrollToTop;
  final Widget emptyDataPlaceHolder;

  //local loading controller;

  ListDataComponent({
    this.itemBuilder,
    this.controller,
    this.getNewData,
    this.getOldData,
    this.loadingWidgetBuilder,
    this.scrollToTop,
    this.emptyDataPlaceHolder,
  }) {
    controller.value.scrollController = scrollController;
    scrollController
      ..addListener(() {
        if (controller.value.loadingController.value.onLoading == false) {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            if (controller.value.data != null) {
              if (controller.value.data.length > 0) {
                getOldData(controller.value.data?.last, scrollController);
              } else {
                getOldData(null, scrollController);
              }
            } else {
              getOldData(controller.value.data?.last, scrollController);
            }
          }

          if (scrollController.position.pixels ==
              scrollController.position.minScrollExtent) {
            if (controller.value.data != null) {
              if (controller.value.data.length > 0) {
                getNewData(controller.value.data?.first, scrollController);
              } else {
                getNewData(null, scrollController);
              }
            } else {
              getNewData(controller.value.data?.first, scrollController);
            }
          }
        }
      });

    if (controller.value.loadingController.value.onLoading == false) {
      if (controller.value.data != null) {
        if (controller.value.data.length > 0) {
          getNewData(controller.value.data?.first, scrollController);
        } else {
          getNewData(null, scrollController);
        }
      } else {
        getNewData(controller.value.data?.first, scrollController);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ListDataComponentValue<T>>(
      valueListenable: controller,
      builder: (context, value, child) {
        return Listener(
          onPointerMove: (pointer) {
            if (value.loadingController.value.onLoading == false) {
              if (pointer.delta.dy > 0) {
                if (scrollController.position.pixels == 0 &&
                    scrollController.position.maxScrollExtent == 0) {
                  if (controller.value.data != null) {
                    if (controller.value.data.length > 0) {
                      getOldData(controller.value.data?.last, scrollController);
                    } else {
                      getOldData(null, scrollController);
                    }
                  } else {
                    getOldData(controller.value.data?.last, scrollController);
                  }
                }
              } else {
                if (scrollController.position.pixels == 0 &&
                    scrollController.position.maxScrollExtent == 0) {
                  if (controller.value.data != null) {
                    if (controller.value.data.length > 0) {
                      getNewData(
                          controller.value.data?.first, scrollController);
                    } else {
                      getNewData(null, scrollController);
                    }
                  } else {
                    getNewData(controller.value.data?.first, scrollController);
                  }
                }
              }
            }
          },
          child: Stack(
            children: <Widget>[
              new ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                addSemanticIndexes: false,
                children: value.data == null || value.data.isEmpty
                    ? <Widget>[
                        loadingController.onLoading == false
                            ? Container(
                                height: 300,
                                child: emptyDataPlaceHolder ??
                                    Center(
                                        child: Text(
                                            System.data.resource.dataIsEmoty)),
                              )
                            : Container(
                                height: 0,
                                width: 0,
                              )
                      ]
                    : List.generate(
                        value.data.length,
                        (i) {
                          return itemBuilder(value.data[i], i);
                        },
                      ),
              ),
              loadingWidgetBuilder != null
                  ? loadingWidgetBuilder(value.loadingController)
                  : CircularProgressIndicatorComponent(
                      controller: value.loadingController,
                    ),
              scrollToTop != null
                  ? scrollToTop(scrollController)
                  : Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: System.data.colorUtil.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_upward,
                            color: System.data.colorUtil.lightTextColor,
                          ),
                          onPressed: () {
                            scrollController.animateTo(
                              1,
                              curve: Curves.easeIn,
                              duration: Duration(seconds: 1),
                            );
                          },
                        ),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}

class ListDataComponentValue<T> {
  CircularProgressIndicatorController loadingController;
  ScrollController scrollController;
  List<T> data = <T>[];

  ListDataComponentValue({
    this.data,
  }) {
    loadingController = CircularProgressIndicatorController();
    loadingController.stopLoading();
  }
}

class ListDataComponentController<T>
    extends ValueNotifier<ListDataComponentValue<T>> {
  ListDataComponentController({ListDataComponentValue<T> value})
      : super(value == null ? ListDataComponentValue() : value);

  get data => value.data;

  set data(List<T> newValue) {
    value.data = newValue;
    notifyListeners();
  }

  void append(List<T> newValue) {
    if (value.data != null) {
      value.data.insertAll(0, newValue);
    } else {
      value.data = newValue;
    }
    notifyListeners();
  }

  void add(List<T> newValue) {
    if (value.data != null) {
      value.data.addAll(newValue);
    } else {
      value.data = newValue;
    }
    notifyListeners();
  }

  void commit() {
    notifyListeners();
  }
}
