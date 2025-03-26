class DepartmentModel {
  bool? success;
  int? statusCode;
  List<Departments>? departments;

  DepartmentModel({this.success, this.statusCode, this.departments});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(Departments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statusCode;
    if (departments != null) {
      data['departments'] = departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Departments {
  int? id;
  String? deptName;
  String? description;
  String? createdAt;
  String? updatedAt;

  Departments(
      {this.id,
      this.deptName,
      this.description,
      this.createdAt,
      this.updatedAt});

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deptName = json['dept_name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dept_name'] = deptName;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
