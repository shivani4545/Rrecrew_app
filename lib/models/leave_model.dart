class LeaveModel {
  String? success;
  String? staus;
  List<Leaves>? leaves;
  int? pendingSick;
  int? pendingCasual;

  LeaveModel(
      {this.success,
      this.staus,
      this.leaves,
      this.pendingSick,
      this.pendingCasual});

  LeaveModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    staus = json['staus'];
    if (json['leaves'] != null) {
      leaves = <Leaves>[];
      json['leaves'].forEach((v) {
        leaves!.add(Leaves.fromJson(v));
      });
    }
    pendingSick = json['pending_sick'];
    pendingCasual = json['pending_casual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['staus'] = staus;
    if (leaves != null) {
      data['leaves'] = leaves!.map((v) => v.toJson()).toList();
    }
    data['pending_sick'] = pendingSick;
    data['pending_casual'] = pendingCasual;
    return data;
  }
}

class Leaves {
  int? id;
  int? userId;
  int? tlId;
  int? managerId;
  int? leaveTypeId;
  String? applyDate;
  String? dateFrom;
  String? dateTo;
  String? fromTime;
  String? toTime;
  String? days;
  int? status;
  String? remarks;
  String? reason;
  dynamic createdAt;
  dynamic updatedAt;

  Leaves(
      {this.id,
      this.userId,
      this.tlId,
      this.managerId,
      this.leaveTypeId,
      this.applyDate,
      this.dateFrom,
      this.dateTo,
      this.fromTime,
      this.toTime,
      this.days,
      this.status,
      this.remarks,
      this.reason,
      this.createdAt,
      this.updatedAt});

  Leaves.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tlId = json['tl_id'];
    managerId = json['manager_id'];
    leaveTypeId = json['leave_type_id'];
    applyDate = json['apply_date'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    days = json['days'];
    status = json['status'];
    remarks = json['remarks'];
    reason = json['reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['tl_id'] = tlId;
    data['manager_id'] = managerId;
    data['leave_type_id'] = leaveTypeId;
    data['apply_date'] = applyDate;
    data['date_from'] = dateFrom;
    data['date_to'] = dateTo;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['days'] = days;
    data['status'] = status;
    data['remarks'] = remarks;
    data['reason'] = reason;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
