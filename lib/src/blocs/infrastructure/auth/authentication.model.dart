import 'package:json_annotation/json_annotation.dart';

part 'authentication.model.g.dart';

@JsonSerializable()
class StaffAuthorization{
  String documentId;
  String email;
  bool isactive;
  bool isadministrator;
  String lastname;
  String name;
  String speciality;

  StaffAuthorization(this.documentId, this.email, this.isactive,
      this.isadministrator, this.lastname, this.name, this.speciality);

  @override
  Map<String, dynamic> toJson() => _$StaffAuthorizationToJson(this);

  factory StaffAuthorization.fromJson(Map<String, dynamic> json) =>
      _$StaffAuthorizationFromJson(json);
}