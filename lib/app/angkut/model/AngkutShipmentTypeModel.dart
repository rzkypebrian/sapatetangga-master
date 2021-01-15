import 'package:json_annotation/json_annotation.dart';
part 'AngkutShipmentTypeModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AngkutShipmentTypeModel {
  int itemId;
  String itemCode;
  String itemDescription;
  double pricing;
  int qty;

  AngkutShipmentTypeModel({
    this.itemId,
    this.itemCode,
    this.itemDescription,
    this.pricing,
    this.qty,
  });

  factory AngkutShipmentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ANgkutShipmentTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ANgkutShipmentTypeModelToJson(this);
}
