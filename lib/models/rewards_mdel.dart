class RewarsModel {
  bool? success;
  int? statusCode;
  List<Assigns>? assigns;

  RewarsModel({this.success, this.statusCode, this.assigns});

  RewarsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['assigns'] != null) {
      assigns = <Assigns>[];
      json['assigns'].forEach((v) {
        assigns!.add(Assigns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statusCode;
    if (assigns != null) {
      data['assigns'] = assigns!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assigns {
  int? id;
  int? userId;
  int? awardId;
  String? date;
  String? reason;
  int? isCash;
  int? isBonus;
  int? month;
  int? amount;
  String? createdAt;
  String? updatedAt;
  Employee? employee;
  Award? award;

  Assigns(
      {this.id,
      this.userId,
      this.awardId,
      this.date,
      this.reason,
      this.isCash,
      this.isBonus,
      this.month,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.employee,
      this.award});

  Assigns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    awardId = json['award_id'];
    date = json['date'];
    reason = json['reason'];
    isCash = json['is_cash'];
    isBonus = json['is_bonus'];
    month = json['month'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    employee = json['employee'] != null
        ? Employee.fromJson(json['employee'])
        : null;
    award = json['award'] != null ? Award.fromJson(json['award']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['award_id'] = awardId;
    data['date'] = date;
    data['reason'] = reason;
    data['is_cash'] = isCash;
    data['is_bonus'] = isBonus;
    data['month'] = month;
    data['amount'] = amount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (employee != null) {
      data['employee'] = employee!.toJson();
    }
    if (award != null) {
      data['award'] = award!.toJson();
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
    apiToken = json['api_token'];
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

class Award {
  int? id;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Award({this.id, this.name, this.description, this.createdAt, this.updatedAt});

  Award.fromJson(Map<String, dynamic> json) {
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
