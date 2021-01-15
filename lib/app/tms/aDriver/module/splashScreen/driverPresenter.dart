import 'dart:async';
import 'dart:convert';

import 'package:enerren/app/tms/aDriver/localData.dart';
import 'package:enerren/app/tms/module/splashScreen/tmsPresenter.dart';
import 'package:enerren/model/DriverModel.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/util/constantUtil.dart';
import 'package:enerren/model/PendingDataModel.dart';

mixin DriverPresenter on TmsPresenter {
  @override
  void onStart() {
    loadingController.startLoading(
      coverScreen: false,
    );
    //initialize
    try {
      Timer.periodic(Duration(seconds: 1), (t) {
        //read driver session data
        if (System.data.sharedPreferences != null) {
          t.cancel();
          try {
            System.data.getLocal<LocalData>().user = DriverModel.fromJson(
                json.decode(
                    System.data.sharedPreferences.getString(PrefsKey.user)));
          } catch (e) {
            System.data.getLocal<LocalData>().user = null;
          }
          //initialize database
          PendingDataModel.initializeTable(System.data.database)
              .catchError((onError) {
            ModeUtil.debugPrint(onError);
          });
          super.onFinish();
        }
      });
    } catch (e) {
      print(System.data.sharedPreferences);
      print("masuk sini $e");
      // super.onFinish();
    }
  }
}
