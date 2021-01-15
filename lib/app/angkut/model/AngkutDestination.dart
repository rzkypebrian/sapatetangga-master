import 'package:json_annotation/json_annotation.dart';
part 'AngkutDestination.g.dart';

@JsonSerializable(explicitToJson: true)
class AngkutDestination {
  String originAddress;
  String originPropinsi;
  String originKecamatan;
  String originKabupaten;
  String originContactPerson;
  String originContactNumber;
  String originAdditionalInfo;
  double originLon;
  double originLat;
  String destinationAddress;
  String destinationPropinsi;
  String destinationKecamatan;
  String destinationKabupaten;
  String destinationContactPerson;
  String destinationContactNumber;
  String destinationAdditionalInfo;
  double destinationLon;
  double destinationLat;

  AngkutDestination({
    this.originAddress,
    this.originPropinsi,
    this.originKecamatan,
    this.originKabupaten,
    this.originContactPerson,
    this.originContactNumber,
    this.originAdditionalInfo,
    this.originLon,
    this.originLat,
    this.destinationAddress,
    this.destinationPropinsi,
    this.destinationKecamatan,
    this.destinationKabupaten,
    this.destinationContactPerson,
    this.destinationContactNumber,
    this.destinationAdditionalInfo,
    this.destinationLon,
    this.destinationLat,
  });

  factory AngkutDestination.fromJson(Map<String, dynamic> json) =>
      _$AngkutDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$AngkutDestinationToJson(this);
}
