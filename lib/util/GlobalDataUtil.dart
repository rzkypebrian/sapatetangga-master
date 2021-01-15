import 'package:enerren/model/AccountModel.dart';
import 'package:enerren/model/RegisterModel.dart';
import 'package:enerren/model/serchShipmentNumberHistory.dart';

class GlobalDataUtil {
  String token = "";
  int pin;
  AccountModel newAccount = new AccountModel();
  String mmassagingToken = "";
  String googleMapApiKey = "AIzaSyBE996CIxSciAsuAPanJ3izkguREa6VvYA";
  int intervalUpdateMaps = 30;
  int intervalUpdateData = 10;
  List<SerchShipmentNumberHistory> historyReceiptSearch = [];

  RegisterModel registerModel;

  GlobalDataUtil();
}
