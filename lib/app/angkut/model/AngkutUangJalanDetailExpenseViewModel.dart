import 'package:json_annotation/json_annotation.dart';
part 'AngkutUangJalanDetailExpenseViewModel.g.dart';

@JsonSerializable(explicitToJson: true)

class AngkutUangJalanDetailExpenseViewModel {
  int walletId;
  int summaryId;
  DateTime recordDatetime;
  double expenseValue;
  String expenseDescription;
  String expenseFileGuid;
  String expenseFile;
  int fileStorageOption;
  String remarks;

  AngkutUangJalanDetailExpenseViewModel({
    this.walletId,
    this.summaryId,
    this.recordDatetime,
    this.expenseValue,
    this.expenseDescription,
    this.expenseFileGuid,
    this.expenseFile,
    this.fileStorageOption,
    this.remarks,
  });

  factory AngkutUangJalanDetailExpenseViewModel.fromJson(
          Map<String, dynamic> json) =>
      _$AngkutUangJalanDetailExpenseViewModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AngkutUangJalanDetailExpenseViewModelToJson(this);

      
}
