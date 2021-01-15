// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AngkutUangJalanDetailExpenseViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AngkutUangJalanDetailExpenseViewModel
    _$AngkutUangJalanDetailExpenseViewModelFromJson(Map<String, dynamic> json) {
  return AngkutUangJalanDetailExpenseViewModel(
    walletId: json['walletId'] as int,
    summaryId: json['summaryId'] as int,
    recordDatetime: json['recordDatetime'] == null
        ? null
        : DateTime.parse(json['recordDatetime'] as String),
    expenseValue: (json['expenseValue'] as num)?.toDouble(),
    expenseDescription: json['expenseDescription'] as String,
    expenseFileGuid: json['expenseFileGuid'] as String,
    expenseFile: json['expenseFile'] as String,
    fileStorageOption: json['fileStorageOption'] as int,
    remarks: json['remarks'] as String,
  );
}

Map<String, dynamic> _$AngkutUangJalanDetailExpenseViewModelToJson(
        AngkutUangJalanDetailExpenseViewModel instance) =>
    <String, dynamic>{
      'walletId': instance.walletId,
      'summaryId': instance.summaryId,
      'recordDatetime': instance.recordDatetime?.toIso8601String(),
      'expenseValue': instance.expenseValue,
      'expenseDescription': instance.expenseDescription,
      'expenseFileGuid': instance.expenseFileGuid,
      'expenseFile': instance.expenseFile,
      'fileStorageOption': instance.fileStorageOption,
      'remarks': instance.remarks,
    };
