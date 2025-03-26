// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  bool? success;
  int? statusCode;
  Details? details;

  Profile({
    this.success,
    this.statusCode,
    this.details,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    success: json["success"],
    statusCode: json["status_code"],
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "details": details?.toJson(),
  };
}

class Details {
  int? userId;
  String? fullName;
  String? division;
  String? department;
  String? designation;
  String? workEmail;
  String? workMobile;
  String? localAddress;

  Details({
    this.userId,
    this.fullName,
    this.division,
    this.department,
    this.designation,
    this.workEmail,
    this.workMobile,
    this.localAddress,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    userId: json["user_id"],
    fullName: json["full_name"],
    division: json["division"],
    department: json["department"],
    designation: json["designation"],
    workEmail: json["work_email"],
    workMobile: json["work_mobile"],
    localAddress: json["local_address"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "full_name": fullName,
    "division": division,
    "department": department,
    "designation": designation,
    "work_email": workEmail,
    "work_mobile": workMobile,
    "local_address": localAddress,
  };
}