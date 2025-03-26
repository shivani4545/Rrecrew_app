class RolesModel {
  bool? success;
  int? statusCode;
  List<Roles>? roles;

  RolesModel({this.success, this.statusCode, this.roles});

  RolesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statusCode;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? roleName;
  String? description;
  String? createdAt;
  String? updatedAt;

  Roles(
      {this.id,
      this.roleName,
      this.description,
      this.createdAt,
      this.updatedAt});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['role_name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role_name'] = roleName;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
