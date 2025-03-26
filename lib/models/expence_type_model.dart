class ExpenceTypeModel {
  int? id;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  ExpenceTypeModel(
      {this.id, this.name, this.description, this.createdAt, this.updatedAt});

  ExpenceTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
