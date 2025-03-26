class PenltysModel {
  bool? success;
  int? statusCode;
  List<Penalties>? penalties;

  PenltysModel({this.success, this.statusCode, this.penalties});

  PenltysModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['penalties'] != null) {
      penalties = <Penalties>[];
      json['penalties'].forEach((v) {
        penalties!.add(Penalties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statusCode;
    if (penalties != null) {
      data['penalties'] = penalties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Penalties {
  int? id;
  int? userId;
  int? penaltyId;
  String? date;
  String? reason;
  int? isCash;
  int? isPenalty;
  int? month;
  int? amount;
  int? status;
  String? createdAt;
  String? updatedAt;
  Employee? employee;
  Penalty? penalty;

  Penalties(
      {this.id,
      this.userId,
      this.penaltyId,
      this.date,
      this.reason,
      this.isCash,
      this.isPenalty,
      this.month,
      this.amount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.employee,
      this.penalty});

  Penalties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    penaltyId = json['penalty_id'];
    date = json['date'];
    reason = json['reason'];
    isCash = json['is_cash'];
    isPenalty = json['is_penalty'];
    month = json['month'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    penalty =
        json['penalty'] != null ? new Penalty.fromJson(json['penalty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['penalty_id'] = penaltyId;
    data['date'] = date;
    data['reason'] = reason;
    data['is_cash'] = isCash;
    data['is_penalty'] = isPenalty;
    data['month'] = month;
    data['amount'] = amount;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (employee != null) {
      data['employee'] = employee!.toJson();
    }
    if (penalty != null) {
      data['penalty'] = penalty!.toJson();
    }
    return data;
  }
}

class Employee {
  int? id;
  String? name;
  String? email;
  int? attendanceflag;
  String? apiToken;
  int? isDelete;
  String? createdAt;
  String? updatedAt;

  Employee(
      {this.id,
      this.name,
      this.email,
      this.attendanceflag,
      this.apiToken,
      this.isDelete,
      this.createdAt,
      this.updatedAt});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    attendanceflag = json['attendanceflag'];
    apiToken = json['api_token'].toString();
    isDelete = json['isDelete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['attendanceflag'] = attendanceflag;
    data['api_token'] = apiToken;
    data['isDelete'] = isDelete;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Penalty {
  int? id;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Penalty(
      {this.id, this.name, this.description, this.createdAt, this.updatedAt});

  Penalty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
