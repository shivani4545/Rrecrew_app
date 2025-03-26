// holiday_model.dart

import 'dart:convert';

class HolidaysModel {
  bool? success;
  int? statusCode;
  List<Holiday>? holidays;

  HolidaysModel({
    this.success,
    this.statusCode,
    this.holidays,
  });

  factory HolidaysModel.fromJson(Map<String, dynamic> json) => HolidaysModel(
    success: json["success"],
    statusCode: json["status_code"],
    holidays: json["holidays"] == null ? [] : List<Holiday>.from(json["holidays"]!.map((x) => Holiday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "holidays": holidays == null ? [] : List<dynamic>.from(holidays!.map((x) => x.toJson())),
  };
}

class Holiday {
  int? id;
  String? name;
  String? description;
  String? dateFrom; // Changed to dateFrom
  String? dateTo;   // Added dateTo

  Holiday({
    this.id,
    this.name,
    this.description,
    this.dateFrom, // Updated
    this.dateTo,   // Added
  });

  factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(
    id: json["id"],
    name: json["name"] ?? '', // Provide default value
    description: json["description"] ?? '', // Provide default value
    dateFrom: json["dateFrom"] ?? json["date"] ?? '', // Updated: Use date if dateFrom is not present
    dateTo: json["dateTo"] ?? json["date"] ?? '',// Added: Provide default value
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "dateFrom": dateFrom, // Updated
    "dateTo": dateTo,   // Added
  };
}