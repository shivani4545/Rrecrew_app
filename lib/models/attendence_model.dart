class AttendanceModel {
  bool? success;
  int? statusCode;
  List<Attendances>? attendances;

  AttendanceModel({this.success, this.statusCode, this.attendances});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['attendances'] != null) {
      attendances = <Attendances>[];
      json['attendances'].forEach((v) {
        attendances!.add(Attendances.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statusCode;
    if (attendances != null) {
      data['attendances'] = attendances!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendances {
  int? id;
  int? userId;
  String? clockIn;
  String? clockOut;
  int? flag;
  String? dayStatus;
  String? regularizeReason;
  String? location;
  int? accept;
  int? reject;
  String? acceptRejectReason;
  String? regularizeType;
  String? createdAt;
  String? updatedAt;
  String? code;
  String? date;

  Attendances(
      {this.id,
      this.userId,
      this.clockIn,
      this.clockOut,
      this.flag,
      this.dayStatus,
      this.regularizeReason,
      this.location,
      this.accept,
      this.reject,
      this.acceptRejectReason,
      this.regularizeType,
      this.createdAt,
      this.updatedAt,
      this.code,
      this.date});

  Attendances.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clockIn = json['clock_in'];
    clockOut = json['clock_out'];
    flag = json['flag'];
    dayStatus = json['day_status'];
    regularizeReason = json['regularize_reason'];
    location = json['location'];
    accept = json['accept'];
    reject = json['reject'];
    acceptRejectReason = json['accept_reject_reason'];
    regularizeType = json['regularize_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    code = json['code'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['clock_in'] = clockIn;
    data['clock_out'] = clockOut;
    data['flag'] = flag;
    data['day_status'] = dayStatus;
    data['regularize_reason'] = regularizeReason;
    data['location'] = location;
    data['accept'] = accept;
    data['reject'] = reject;
    data['accept_reject_reason'] = acceptRejectReason;
    data['regularize_type'] = regularizeType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['code'] = code;
    data['date'] = date;
    return data;
  }
}
