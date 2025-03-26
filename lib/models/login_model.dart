// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? success;
  int? status;
  int? userId;
  String? apiToken;
  String? message;
  String? greeting;
  String? timeMessage;
  String? userName;

  LoginModel({
    this.success,
    this.status,
    this.userId,
    this.apiToken,
    this.message,
    this.greeting,
    this.timeMessage,
    this.userName,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    status: json["status"],
    userId: json["user_id"],
    apiToken: json["api_token"],
    message: json["message"],
    greeting: json["greeting"],
    timeMessage: json["time_message"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "user_id": userId,
    "api_token": apiToken,
    "message": message,
    "greeting": greeting,
    "time_message": timeMessage,
    "user_name": userName,
  };
}
