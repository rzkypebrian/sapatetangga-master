// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sieradDeliverStock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SieradDeliverStock _$SieradDeliverStockFromJson(Map<String, dynamic> json) {
  return SieradDeliverStock(
    poultryShipmentId: json['poultryShipmentId'] as int,
    driverId: json['driverId'] as int,
    driverName: json['driverName'] as String,
    qtyReceived: json['qtyReceived'] as int,
    qtyBonusReceived: json['qtyBonusReceived'] as int,
    qtyBrokenReceived: json['qtyBrokenReceived'] as int,
    qtyBasketReceived: json['qtyBasketReceived'] as int,
  );
}

Map<String, dynamic> _$SieradDeliverStockToJson(SieradDeliverStock instance) =>
    <String, dynamic>{
      'poultryShipmentId': instance.poultryShipmentId,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'qtyReceived': instance.qtyReceived,
      'qtyBonusReceived': instance.qtyBonusReceived,
      'qtyBrokenReceived': instance.qtyBrokenReceived,
      'qtyBasketReceived': instance.qtyBasketReceived,
    };
