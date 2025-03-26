class PoliciesModel {
  int? id;
  String? title;
  String? url;
  String? createdAt;
  String? updatedAt;

  PoliciesModel(
      {this.id, this.title, this.url, this.createdAt, this.updatedAt});

  PoliciesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
