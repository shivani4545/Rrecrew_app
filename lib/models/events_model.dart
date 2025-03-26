// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

List<EventModel> eventModelFromJson(String str) => List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  int? id;
  String? eventName;
  String? description;
  String? city;
  String? locationName;
  String? latitudeLongitude;
  String? locationType;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  EventModel({
    this.id,
    this.eventName,
    this.description,
    this.city,
    this.locationName,
    this.latitudeLongitude,
    this.locationType,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    id: json["id"],
    eventName: json["event_name"],
    description: json["description"],
    city: json["city"],
    locationName: json["location_name"],
    latitudeLongitude: json["latitude_longitude"],
    locationType: json["location_type"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "event_name": eventName,
    "description": description,
    "city": city,
    "location_name": locationName,
    "latitude_longitude": latitudeLongitude,
    "location_type": locationType,
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
