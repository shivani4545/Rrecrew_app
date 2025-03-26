class BranchesModel {
  bool? success;
  int? statusCode;
  List<Branches>? branches;

  BranchesModel({this.success, this.statusCode, this.branches});

  BranchesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(Branches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statusCode;
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branches {
  int? id;
  String? branchName;
  String? branchCity;
  String? branchAddress;
  int? managerId;
  double? branchLat;
  double? branchLong;
  String? createdAt;
  String? updatedAt;

  Branches(
      {this.id,
      this.branchName,
      this.branchCity,
      this.branchAddress,
      this.managerId,
      this.branchLat,
      this.branchLong,
      this.createdAt,
      this.updatedAt});

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branch_name'];
    branchCity = json['branch_city'];
    branchAddress = json['branch_address'];
    managerId = json['manager_id'];
    branchLat = json['branch_lat'];
    branchLong = json['branch_long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['branch_name'] = branchName;
    data['branch_city'] = branchCity;
    data['branch_address'] = branchAddress;
    data['manager_id'] = managerId;
    data['branch_lat'] = branchLat;
    data['branch_long'] = branchLong;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
